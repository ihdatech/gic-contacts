import 'package:contacts/src/data/remote/remote_app_dio.dart';
import 'package:contacts/src/models/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_data_source.g.dart';

final remoteDataSourceProvider = Provider((ref) => RemoteDataSource(ref.read));

@RestApi()
abstract class RemoteDataSource {
  factory RemoteDataSource(Reader reader) => _RemoteDataSource(reader(remoteAppDioProvider));

  @GET('/contact/{id}')
  Future<ContactModel> fisrtContact({
    @Path("id") required int id,
  });

  @GET('/contact')
  Future<List<ContactModel>> getContact();

  @POST('/contact')
  Future<bool> insertContact({
    @Body() required String body,
  });

  @PUT('/contact/{id}')
  Future<ContactModel> updateContact({
    @Path("id") required int id,
    @Body() required String body,
  });

  @DELETE('/contact/{id}')
  Future<int> deleteContact({
    @Path("id") required int id,
  });
}
