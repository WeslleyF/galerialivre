import 'package:local_image_provider/local_image_provider.dart' as lip;
import 'package:flutter/painting.dart';

class RepositoryImages{
  
  List<lip.LocalImage> _images = [];

  Future<List<String>> getDeviceImages() async
  {
    List<String> listOfUrls = [];
    List<lip.LocalImage> images;

    lip.LocalImageProvider imageProvider = lip.LocalImageProvider();
    bool hasPermission = await imageProvider.initialize();
    if ( hasPermission) 
    {
      images = await imageProvider.findLatest(100);
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

    _images = images;
    return listOfUrls;

  }
 
  lip.DeviceImage GetImage(int index)
  {
    lip.DeviceImage deviceImg = lip.DeviceImage(_images[index]);
    return deviceImg;
  }

}
