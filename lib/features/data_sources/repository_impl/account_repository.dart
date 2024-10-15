import '../../domain/entities/user.dart';
import '../../domain/repository/account_repository.dart';
import '../API/remote_data_source.dart';

class AccountRepositoryImpl implements AccountRepository {
  final RemoteDataSource remoteDataSource;

  AccountRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> homeProfile(String userID) async
  {
    final user = await remoteDataSource.homeProfile(userID);
    return User
      (
        firstName:  user.firstName,
        lastName: user.lastName,
        rank: user.rank,
        points: user.points,
        profileImage: user.profileImage,
      );
  }

  @override
  Future<User> getProfile(String email) async
  {
    final user = await remoteDataSource.getProfile(email);
    return User
      (
        firstName:  user.firstName,
        lastName: user.lastName,
        email: user.email,
        profileImage: user.profileImage,
        coverImage: user.coverImage,
        firstPlaceCount: user.firstPlaceCount,
        secondPlaceCount: user.secondPlaceCount,
        thirdPlaceCount: user.thirdPlaceCount,
        description: user.description,
        rank: user.rank,
    );
  }

  @override
  Future<void> deleteAccount(String email) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfile(String email) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
