import 'package:local_image_provider/local_image_provider.dart' as lip;

class RepositoryImages{
  

  Future<List<String>> getDeviceImages() async
  {
    List<String> listOfUrls = [];

    lip.LocalImageProvider imageProvider = lip.LocalImageProvider();
    bool hasPermission = await imageProvider.initialize();
    if ( hasPermission) 
    {
      List<lip.LocalImage> images = await imageProvider.findLatest(100);
      if (images.isNotEmpty) 
      {
        for (lip.LocalImage img in images) 
        {
          listOfUrls.add(img.fileName.toString());
        }
           
      }
      else 
      {
        throw Exception("Nenhuma imagem encontrada no dispositivo.");
      }
    }
    else 
    {
        throw Exception("É necessário autorizar o aplicativo a acessar as imagens do dispositivo");
    } 

    return listOfUrls;

  }
 
}
