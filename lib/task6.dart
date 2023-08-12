void main() {
  Map<String, dynamic> myAccount = {
    'posts': [
      {
        'title': 'flutter',
        'content':
            "flutter is a framwork by googel for building multi-platform application from a single codebase ",
        'date': "2/6/2023",
        'likes': {
          'ahmed': {
            'since': 27,
            'info': {
              'name': 'ahmed',
              'age': 22,
              'address': 'cairo',
              'email': 'ahmed22@gmail.com',
              'freind': ['khalid', 'ashraf', 'youssef'],
            }
          },
          'ali': {
            'since': 8,
            'info': {
              'name': 'ail',
              'age': 31,
              'address': 'alex',
              'email': 'ail31@gmail.com',
              'freind': ['osama', 'mohamed', 'yasser'],
            }
          },
          'mohamed': {
            'since': 35,
            'info': {
              'name': 'mohamed',
              'age': 28,
              'address': 'october',
              'email': 'mohamed28@gmail.com',
              'freind': ['ahmed', 'islam', 'ashraf'],
            }
          },
        },
        'share': {
          'osama': {'name': 'osama', 'email': 'osama19@gmail.com'},
          'ahmed': {'name': 'ahmed', 'email': 'ahmed25@gmail.com'},
          'mohamed': {'name': 'mohamed', 'email': 'mohamed28@gmail.com'}
        }
      },
      {
        'title': 'ai',
        'content':
            "AI is a wide-ranging branch of computer science concerned with building samrt machines capalee of performing tasks that typically require human intelligance",
        'date': "1/4/2023",
        'likes': {
          'Khalid': {
            'since': 24,
            'info': {
              'name': 'Khalid',
              'age': 20,
              'address': 'Giza',
              'email': 'khalid20@gmail.com',
              'freind': ['Ashraf', 'Youssef', 'Mohamed'],
            }
          },
          'Ahmed': {
            'since': 45,
            'info': {
              'name': 'Ahmed',
              'age': 41,
              'address': 'alex',
              'email': 'ahmed41@gmail.com',
              'freind': ['Yasser', 'Ashraf', 'Hassan'],
            }
          },
          'mohamed': {
            'since': 35,
            'info': {
              'name': 'mohamed',
              'age': 28,
              'address': 'october',
              'email': 'mohamed28@gmail.com',
              'freind': ['ahmed', 'islam', 'ashraf'],
            }
          },
        },
        'share': {
          'Hassan': {'name': 'Hassan', 'email': ' hassan19@gmail.com'},
          'Mohamed': {'name': 'Mohamed', 'email': 'mohamed28@gmail.com'},
          'Yasser': {'name': ' Yasser', 'email': 'yasser33@gmail.com'}
        }
      }
    ]
  };
// (1)
  final Map<String, dynamic> firstPostLikes = myAccount['posts'][0]['likes'];
  String? firstLikerName;
  Map<String, dynamic> firstLikerInfo = {};

  firstPostLikes.forEach((likerName, likerData) {
    firstLikerName ??= likerName;
    firstLikerInfo = likerData['info'];
  });

  if (firstLikerName != null) {
    print('First Liker on Post 1: $firstLikerName\n');
    print('Liker Info: $firstLikerInfo\n');
  } else {
    print('No likers found for the first post.');
  }
  print("--------------------------------------");
//(2)
  final Map<String, dynamic> nameLike = myAccount['posts'][0]['likes'];
  final Map<String, dynamic> nameShare = myAccount['posts'][0]['share'];
  nameLike.forEach((likeKey, likeValue) {
    nameShare.forEach((shareKey, shareValue) {
      if (likeValue['info']['email'] == shareValue['email']) {
        print("name is: ${shareValue['name']}\n");
        print("email is:${shareValue['email']}\n");
      }
    });
  });
  print("--------------------------------------");
//(3)
  List loopFrind = [];
  nameLike.forEach((likeKey, likeValue) {
    loopFrind = likeValue['info']['freind'];
    loopFrind.forEach((element) {
      if (loopFrind.contains('ashraf')) {
        print("freind $likeKey $element");
      }
    });
  });
  print("--------------------------------------");
//(4)
  final Map<String, dynamic> nameLike2 = myAccount['posts'][1]['likes'];
  final Map<String, dynamic> nameShare2 = myAccount['posts'][1]['share'];
  List matchPost1 = [];

  nameLike.forEach((likeKey, likeValue) {
    nameShare.forEach((shareKey, shareValue) {
      if (likeValue['info']['email'] == shareValue['email']) {
        matchPost1.add(shareValue['name']);
      }
    });
  });

  nameLike2.forEach((likeKey, likeValue) {
    nameShare2.forEach((shareKey, shareValue) {
      if (likeValue['info']['email'] == shareValue['email']) {
        matchPost1.add(shareValue['name']);
      }
    });
  });
  if (matchPost1.toSet().toList().isNotEmpty) {
    matchPost1.forEach((element) {
      nameLike2.forEach((key, value) {
        if (key == element) {
          print(element);
        }
      });
    });
  }
  print("--------------------------------------");
// (5)
  int totalLikePost1 = 0, totalLikePost2 = 0;
  nameLike.forEach((key, value) {
    totalLikePost1 += value['since'] as int;
  });
  nameLike2.forEach((key, value) {
    totalLikePost2 += value['since'] as int;
  });
  if (totalLikePost1 > totalLikePost2) {
    print("\n$firstPostLikes");
  } else
    print("\n$nameLike2");
    
}
