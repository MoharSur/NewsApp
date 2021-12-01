import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  BuildContext context;
  CustomDrawer(this.context);
  String about =
      'This app provides you different kinds of news to read from all over the world. It is developed by Mohar, Hope u like the app and do not forget to rate the app when released.\n\nThanks for reading !';
  String policy =
      'The privacy policy of this app states that the app must be used fairly by the user and no 3rd party plugins should be used to toggle anything in the app without the permission of the developer.';
  void showAboutDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16),
            ),
            title: const Text('About',
                style: TextStyle(color: Colors.red)),
            content: Text(about),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text('Close', style: TextStyle(color: Colors.red))),
            ],
          );
        });
  }

  void showPolicyDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16),
            ),
            title: const Text('Privacy Policy',
                style: TextStyle(color: Colors.red)),
            content: Text(policy),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text('Close', style: TextStyle(color: Colors.red))),
            ],
          );
        });
  }

  void share() {}
  void rate() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rating is currently not available')));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft),
        ),
        child: Material(
          color: Colors.transparent,
          child: ListView(
            children: [
             // Image.network('https://cdn.vox-cdn.com/thumbor/WZYcmUzKybSmNn5LzwfRVIyQPKE=/0x0:640x480/1200x800/filters:focal(268x189:370x291)/cdn.vox-cdn.com/uploads/chorus_image/image/65543002/bbc_logo_red.0.jpg',
             //               fit: BoxFit.fitWidth),
              //Image.asset('icon.png', height: 200),
              // ClipRRect(
              //   borderRadius: const BorderRadius.vertical(bottom: Radius.circular(14.0)),
              //   child: Image.network(
              //     'https://alastaircampbell.org/wp-content/uploads/2018/02/BBC_NEWS-1250x640.png',
              //     width: double.infinity),
              // ),
              const SizedBox(height: 8.0),
              ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    showAboutDialog();
                  },
                  leading: const Icon(Icons.account_box, color: Colors.white),
                  title:
                      const Text('About', style: TextStyle(color: Colors.white))),
              ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    showPolicyDialog();
                  },
                  leading: const Icon(Icons.privacy_tip, color: Colors.white),
                  title: const Text('Privacy Policy',
                      style: TextStyle(color: Colors.white))),
              Divider(
                  thickness: 0.3,
                  color: Colors.white.withOpacity(0.5),
                  height: 24.0),
                  
              // ListTile(
              //     onTap: () {
              //       Navigator.of(context).pop();
              //       share();
              //     },
              //     leading: const Icon(Icons.share, color: Colors.white),
              //     title:
              //         const Text('Share', style: TextStyle(color: Colors.white))),
              
              ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    rate();
                  },
                  leading: const Icon(Icons.star, color: Colors.white),
                  title:
                      const Text('Rate', style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
