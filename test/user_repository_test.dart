import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_testing_crud/model/user_model.dart';
import 'package:flutter_unit_testing_crud/user_repository.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client {} 

void main() {
   late UserRepository userRepository;
   late MockHttpClient mockHttpClient;
  setUp(() { 
    mockHttpClient = MockHttpClient(); 
   userRepository = UserRepository(mockHttpClient);
}); 

group('User Repoisitory testing', () { 
  test('Fetch All Users ', () async {
    //Arrange
    when(() => mockHttpClient.get(Uri.parse('http://192.168.1.72:3001/api/getuser'))).thenAnswer((invocation)async{
      return Response('isA<List<UserModel>>()', 200);
    }); 
    //Act 
    final user = await userRepository.getUser(); 
    //Assert
    expect(user, isA<List<UserModel>>()); 
  });
 
  test('Create User', () async {
    //Arrange
    
    //Act
    final user = await userRepository.createUser('TESTING', 'NEWUSERMAIL'); 
    //Assert
    expect(user, isA<UserModel>()); 
  });

   test('Update User', () async {
    //Arrange
 when(() => mockHttpClient.get(Uri.parse('http://192.168.1.72:3001/api/updateuser/?name=TESTING&newname=UPDATE'))).thenAnswer((invocation)async{
      return Response('isA<UserModel>()', 200); 
    }); 
    //Act
    final user = await userRepository.updateUser('TESTING', 'TESTING UPDATE'); 
    //Assert
    expect(user, isA<UserModel>());  
  });

  test('Delete User', () async { 
    //Arrange
     when(() => mockHttpClient.get(Uri.parse('http://192.168.1.72:3001/api/deleteuser/TESTING UPDATE'))).thenAnswer((invocation)async{
      return Response('isA<UserModel>()', 200);
    });  
    //Act
    final user = await userRepository.deleteUser('TESTING UPDATE'); 
    //Assert
    expect(user, isA<UserModel>());  
  });

 
 });  
}