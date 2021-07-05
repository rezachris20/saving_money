import 'dart:convert';
import 'dart:io';

import 'package:saving_money/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_services.dart';
part 'portofolio_services.dart';
part 'transactions_services.dart';
part 'my_savings_services.dart';
part 'portofolio_savings_target_services.dart';
part 'list_of_family_services.dart';

String baseURL = "http://saving-money.solutionwithreza.com/api/";
String imageStorage = "http://saving-money.solutionwithreza.com/storage/";