import 'package:flutter/material.dart';

const List<String> categoriesList = [
  'Gıda',
  'El İşi',
];

const List<String> gidaList = [
  'Kuruyemiş',
  'Baklagiller',
  'Mevsimlik Ürünler',
  'Konserve',
  'Yöreye Özgü',
];
const List<String> elSanatlariList = [
  'El İşi',
  'Bujiteri',
  'Ahşap Ürünler',
  'Seramik',
  'Cam İşlemeler',
];
const List<String> locations = [
  'Ankara',
  'Bursa',
  'Manisa',
  'Antalya',
  'Edirne',
  'Konya',
  'Kastamonu',
];

const List<String> productPictures = [
  'Nohut',
  'Fasulye',
  'Tursu',
  'Cekirdek',
  'Domates',
  'Masa',
  'Boncuk',
  'Vazo',
  'Bardak',
];

List<DropdownMenuItem> getSubList(bool switchList) {
  List<DropdownMenuItem<String>> dropdownItems = [];
  if (switchList) {
    for (String gidaItem in gidaList) {
      var newItem = DropdownMenuItem(
        child: Text(gidaItem),
        value: gidaItem,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  } else {
    for (String gidaItem in elSanatlariList) {
      var newItem = DropdownMenuItem(
        child: Text(gidaItem),
        value: gidaItem,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }
}

List<DropdownMenuItem> getElSanatlariListItem() {
  List<DropdownMenuItem<String>> dropdownItems = [];
  for (String gidaItem in elSanatlariList) {
    var newItem = DropdownMenuItem(
      child: Text(gidaItem),
      value: gidaItem,
    );
    dropdownItems.add(newItem);
  }
  return dropdownItems;
}

List<DropdownMenuItem> getLocationItem() {
  List<DropdownMenuItem<String>> dropdownItems = [];
  for (String locationItem in locations) {
    var newItem = DropdownMenuItem(
      child: Text(locationItem),
      value: locationItem,
    );
    dropdownItems.add(newItem);
  }
  return dropdownItems;
}

List<DropdownMenuItem> getProductPictures() {
  List<DropdownMenuItem<String>> dropdownItems = [];
  for (String productPictureItem in productPictures) {
    var newItem = DropdownMenuItem(
      child: Text(productPictureItem),
      value: productPictureItem,
    );
    dropdownItems.add(newItem);
  }
  return dropdownItems;
}
