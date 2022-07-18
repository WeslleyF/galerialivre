import 'package:local_image_provider/local_image_provider.dart' as lip;

class RepositoryImages{

  Future<List<lip.DeviceImage>> loadDeviceImages() async
  {
     List<lip.LocalImage> images = [];
     List<lip.DeviceImage> listImages = [];

     lip.LocalImageProvider imageProvider = lip.LocalImageProvider();
     bool hasPermission = await imageProvider.initialize();

     if (!hasPermission) throw Exception("É necessário autorizar o aplicativo a acessar as imagens do dispositivo");
     
     images = await imageProvider.findLatest(100);
      
     if (!images.isNotEmpty) throw Exception("Nenhuma imagem encontrada no dispositivo.");

    for(lip.LocalImage imagem in images)
    {
       listImages.add(lip.DeviceImage(imagem));
    }

    return listImages;
  }

}
