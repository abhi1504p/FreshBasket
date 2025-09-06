import 'package:get/get.dart';

class MyOrderController extends GetxController {

  RxList orderArr = [
    {
      'item_name':'Apple',
      'rating':5,
      'status':'',
      "image":
      "https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg",
    },
    {
      "item_name": "Banana",
      'rating':2,
      'status':'',
      "image":
      "https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg"
    } ,{
      'item_name':'mango',
      'rating':4,
      'status':'',
      "image":
      "https://upload.wikimedia.org/wikipedia/commons/9/90/Hapus_Mango.jpg"
    }
  ].obs;



}