class UserEntity {
  final String name;
  final String email;
  final String uId;

  UserEntity({required this.name, required this.email, required this.uId});
// The important of toMap is to convert the entity to a map so that it can be saved in the database or sent to the server as a json object.
  toMap(){
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
    }
  }
