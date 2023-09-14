// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:json_to_form/json_to_form.dart';

// class ApiProvider extends ChangeNotifier {
//   String authorizationType = "No Auth";
//   String authorizationValue = "";
//   String apiUrl = "";
//   String response = "";

//   void setAuthorizationType(String type) {
//     authorizationType = type;
//     notifyListeners();
//   }

//   void setAuthorizationValue(String value) {
//     authorizationValue = 'Bearer $value';
//     notifyListeners();
//   }

//   void setApiUrl(String url) {
//     apiUrl = url;
//     notifyListeners();
//   }

//   Future<void> makeApiRequest() async {
//     try {
//       final headers = {
//         'Authorization': authorizationValue,
//         'Content-Type': 'application/json',
//       };

//       final httpResponse = await http.get(Uri.parse(apiUrl), headers: headers);

//       if (httpResponse.statusCode == 200) {
//         response = httpResponse.body;
//       } else {
//         response = 'Error: ${httpResponse.statusCode}';
//       }
//     } catch (e) {
//       response = 'Error: $e';
//     }

//     notifyListeners();
//   }
// }

// class Postman extends StatelessWidget {
//   const Postman({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChangeNotifierProvider(
//         create: (context) => ApiProvider(),
//         child: const MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final apiProvider = Provider.of<ApiProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Postman'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             DropdownButton<String>(
//               value: apiProvider.authorizationType,
//               onChanged: (value) => apiProvider.setAuthorizationType(value!),
//               items: ['No Auth', 'Bearer Token', 'Other'].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 20),
//             if (apiProvider.authorizationType != 'No Auth')
//               TextFormField(
//                 onChanged: (value) => apiProvider.setAuthorizationValue(value),
//                 decoration: const InputDecoration(labelText: 'Authorization Value'),
//               ),
//             const SizedBox(height: 20),
//             TextFormField(
//               onChanged: (value) => apiProvider.setApiUrl(value),
//               decoration: const InputDecoration(labelText: 'API URL'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => apiProvider.makeApiRequest(),
//               child: const Text('Send Request'),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(apiProvider.response),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//2nd experiment

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiProvider extends ChangeNotifier {
  String clientId = "ec2e9bc000884ed4ba6fb2ef738cfbfc";
  String clientSecret = "ca5c2989a02b489cba8422d73cf48355";
  String redirectUri =
      "http://localhost:1234/"; // Replace with your actual redirect URI
  String apiUrl = "";
  String code = "";
  String token = "";
  String response = "";

  void setClientId(String id) {
    clientId = id;
    notifyListeners();
  }

  void setClientSecret(String secret) {
    clientSecret = secret;
    notifyListeners();
  }

  void setApiUrl(String url) {
    apiUrl = url;
    notifyListeners();
  }

  Future<void> launchAuthorizationUrl() async {
    final authorizationUrl =
        "https://accounts.spotify.com/authorize?client_id=$clientId&redirect_uri=$redirectUri&response_type=code&scope=user-read-currently-playing";

    if (await canLaunch(authorizationUrl)) {
      await launch(authorizationUrl);
    } else {
      throw "Could not launch the authorization URL";
    }
  }

  Future<void> exchangeCodeForToken() async {
    try {
      const authUrl = "https://accounts.spotify.com/api/token";

      final body = {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
        'client_id': clientId,
        'client_secret': clientSecret,
      };

      final httpResponse = await http.post(Uri.parse(authUrl), body: body);

      if (httpResponse.statusCode == 200) {
        final responseBody = json.decode(httpResponse.body);
        token = responseBody['access_token'];
      } else {
        token = 'Error: ${httpResponse.statusCode}';
      }
    } catch (e) {
      token = 'Error: $e';
    }

    notifyListeners();
  }

  Future<void> makeApiRequest() async {
    try {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final httpResponse = await http.get(Uri.parse(apiUrl), headers: headers);

      if (httpResponse.statusCode == 200) {
        response = httpResponse.body;
      } else {
        response = 'Error: ${httpResponse.statusCode}';
      }
    } catch (e) {
      response = 'Error: $e';
    }

    notifyListeners();
  }
}

Map<String, String> getHashParams() {
  final hashParams = <String, String>{};
  final queryParameters = Uri.parse(Uri.base.toString()).queryParameters;

  queryParameters.forEach((key, value) {
    hashParams[key] = Uri.decodeComponent(value);
  });

  return hashParams;
}

class Postman extends StatelessWidget {
  const Postman({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ApiProvider(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Define the URL of your Node.js server
  final String serverUrl = "http://localhost:3000";

  // Function to fetch data from the server
  Future<String> fetchData() async {
    const String endpoint = "/api/getStringTest";
    final response = await http.get(Uri.parse('$serverUrl$endpoint'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data from the server');
    }
  }

  // final String spotifyAuthUrl = 'YOUR_NODE_SERVER_URL/login';

  // void _loginWithSpotify(BuildContext context) async {
  //   final response = await http.get(Uri.parse(spotifyAuthUrl));

  //   // Handle the response and redirect to the Spotify login page.
  //   // You may need to use a webview or launch a browser for this step.
  // }

  Future<String> fetchLogin() async {
    const String endpoint = "/login";
    final response = await http.get(Uri.parse('$serverUrl$endpoint'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data from the server');
    }
  }

  Future<String> fetchDataToken() async {
    const String endpoint = "/callback";
    final response = await http.get(Uri.parse('$serverUrl$endpoint'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data from the server');
    }
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Postman'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (value) => apiProvider.setClientId(value),
              decoration: const InputDecoration(labelText: 'Client ID'),
            ),
            TextFormField(
              onChanged: (value) => apiProvider.setClientSecret(value),
              decoration: const InputDecoration(labelText: 'Client Secret'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await apiProvider.launchAuthorizationUrl();
              },
              child: const Text('Authorize'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) => apiProvider.code = value,
              decoration:
                  const InputDecoration(labelText: 'Authorization Code'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) => apiProvider.setApiUrl(value),
              decoration: const InputDecoration(labelText: 'API URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await apiProvider.exchangeCodeForToken();
                await apiProvider.makeApiRequest();
              },
              child: const Text('Send Request'),
            ),
            Center(
              child: FutureBuilder<String>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Show a loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Data from Server: ${snapshot.data}');
                  }
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                fetchLogin();
              },
              child: const Text('Login with Spotify'),
            ),
            ElevatedButton(
              onPressed: () {
                // getHashParams();
                print(getHashParams());
              },
              child: const Text('Get Hash Param'),
            ),

            // Center(
            //   child: FutureBuilder<String>(
            //     future: fetchLogin(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const CircularProgressIndicator(); // Show a loading indicator
            //       } else if (snapshot.hasError) {
            //         return Text('Error: ${snapshot.error}');
            //       } else {
            //         return Text('Data from Server: ${snapshot.data}');
            //       }
            //     },
            //   ),
            // ),
            Center(
              child: FutureBuilder<String>(
                future: fetchDataToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Show a loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Data from Server: ${snapshot.data}');
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(apiProvider.response),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
