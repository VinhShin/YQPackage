import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtils{

  static const  formatYMD = "yyyy-MM-dd";
  static const formatDateTime = "yyyy-MM-dd HH:mm:ss";
  static const formatDMY = "dd-MM-yyyy";

  static final DateUtils _singleton = DateUtils._internal();

  DateUtils._internal();

  factory DateUtils() {
    return _singleton;
  }

  String getCurrentDate(){
    return DateFormat(formatYMD).format(DateTime.now());
  }

  String getCurrentDatetime(){
    return DateFormat(formatDateTime).format(DateTime.now());
  }

  String getDateByFormat(DateTime date, {String dateFormat = formatYMD}){
    return DateFormat(dateFormat).format(date);
  }

  bool isSameDate(DateTime date1, DateTime date2){
    return date1.month == date2.month && date1.year == date2.year && date1.day == date2.day;
  }

  int dayOfYear(DateTime date) {
    return int.parse(DateFormat("D").format(date));
  }

  int weekOfYear(DateTime date){
    return ((dayOfYear(date) - date.weekday + 10) / 7).floor();
  }

  String getYesterday(){
    DateTime now = DateTime.now();
    DateTime yesterday = new DateTime(now.year, now.month, now.day - 1);
    return DateFormat(formatYMD).format(yesterday);
  }

  String getFirstDayOfWeek(){
    DateTime now = DateTime.now();
    DateTime firtDayOfWeek = new DateTime(
        now.year, now.month, now.day - now.weekday + 1); //tinh thu 2
    return DateFormat(formatYMD).format(firtDayOfWeek);
  }

  String getEndDayOfWeek(){
    DateTime now = DateTime.now();
    DateTime endDayOfWeek = new DateTime(now.year, now.month, now.day + (7 - now.weekday));
    return DateFormat(formatYMD).format(endDayOfWeek);
  }

  String getFirstDayOfLastWeek(){
    DateTime now = DateTime.now();
    DateTime firtDayOfWeek = new DateTime(
        now.year, now.month, now.day - now.weekday + 1 - 7);
    return DateFormat(formatYMD).format(firtDayOfWeek);
  }

  String getEndDayOfLastWeek(){
    DateTime now = DateTime.now();
    DateTime endDayOfWeek = new DateTime(now.year, now.month, now.day + (7 - now.weekday) - 7);
    return DateFormat(formatYMD).format(endDayOfWeek);
  }

  String getFirstDayOfMonth(){
    DateTime now = DateTime.now();
    DateTime first = new DateTime(now.year, now.month, 1);
    return DateFormat(formatYMD).format(first);
  }

  String getEndDayOfMonth(){
    DateTime now = DateTime.now();
    DateTime end = new DateTime(now.year, now.month + 1, 0);
    return DateFormat(formatYMD).format(end);
  }


  String getFirstDayOfLastMonth(){
    DateTime now = DateTime.now();
    DateTime first = new DateTime(now.year, now.month-1, 1);
    return DateFormat(formatYMD).format(first);
  }

  String getEndDayOfLastMonth(){
    DateTime now = DateTime.now();
    DateTime end = new DateTime(now.year, now.month, 0);
    return DateFormat(formatYMD).format(end);
  }

  String getFirstDayOfThisQuarter(){
    DateTime now = DateTime.now();
    DateTime first;
    if(now.month < 4){
      first = DateTime(now.year, 1, 1);
    } else if(now.month < 7){
      first = DateTime(now.year, 4, 1);
    } else if(now.month < 10){
      first = DateTime(now.year, 7, 1);
    } else{
      first = DateTime(now.year, 10,1);
    }
    return DateFormat(formatYMD).format(first);
  }

  String getEndDayOfThisQuarter(){
    DateTime now = DateTime.now();
    DateTime end;
    if(now.month < 4){
      end = DateTime(now.year, 4, 0);
    } else if(now.month < 7){
      end = DateTime(now.year, 7, 0);
    } else if(now.month < 10){
      end = DateTime(now.year, 10, 0);
    } else{
      end = DateTime(now.year+1, 1,0);
    }
    return DateFormat(formatYMD).format(end);
  }

  String getFirstDayOfLastQuarter(){
    DateTime now = DateTime.now();
    DateTime first;
    if(now.month < 4){
      first = DateTime(now.year, 10, 1);
    } else if(now.month < 7){
      first = DateTime(now.year, 1, 1);
    } else if(now.month < 10){
      first = DateTime(now.year, 4, 1);
    } else{
      first = DateTime(now.year, 7,1);
    }
    return DateFormat(formatYMD).format(first);
  }

  String getEndDayOfLastQuarter(){
    DateTime now = DateTime.now();
    DateTime end;
    if(now.month < 4){
      end = DateTime(now.year + 1, 1, 0);
    } else if(now.month < 7){
      end = DateTime(now.year, 4, 0);
    } else if(now.month < 10){
      end = DateTime(now.year, 7, 0);
    } else{
      end = DateTime(now.year, 10,0);
    }
    return DateFormat(formatYMD).format(end);
  }

  String getFirstDayOfThisYear(){
    DateTime now = DateTime.now();
    DateTime first =  DateTime(now.year, 1,1);
    return DateFormat(formatYMD).format(first);
  }
  
  String getEndDayOfThisYear(){
    DateTime now = DateTime.now();
    DateTime end =  DateTime(now.year+1, 1,0);
    return DateFormat(formatYMD).format(end);
  }
  
  Future<DateTime?> selectDate(BuildContext context, DateTime initDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: initDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != initDate) {
      return picked;
    };
    return null;
  }

  Future<TimeOfDay?> selectTime(BuildContext context, TimeOfDay initTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initTime,
    );
    if (picked != null && picked != initTime) {
      return picked;
    };
    return null;
  }
}
