import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:app/controller/routes.dart';
import 'package:app/view/pages/script_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasData = false;

  Color primaryGreen = Color(0xFF4CAF50); // Primary Green
  Color secendoryGreen = Color(0xFF2E7D32); // Primary Green
  Color white = Color(0xFFFFFFFF); // White
  Color darkGray = Color(0xFF424242); // Dark Gray
  Color black = Color(0xFF212121); // Dark Gray

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    int crossAxisCount = 15;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: width * 0.3,
          alignment: Alignment.center,
          child: TextField(decoration: InputDecoration(hintText: "Search ...")),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.grid_view_rounded, color: primaryGreen),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_rounded, color: primaryGreen),
          ),
        ],
        centerTitle: true,
      ),
      body:
          hasData
              ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      color: primaryGreen,
                      child: getRandomIcon(),
                    ),
                  );
                },
              )
              : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Start from scratch or"),
                    TextButton(
                      onPressed: () async {
                        hasData = await pickAndLoadJsonFile();
                        setState(() {});
                      },
                      child: Text("Import data"),
                    ),
                  ],
                ),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routes().pushNamed(context, ScriptPage());
        },
        backgroundColor: primaryGreen,
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.add, size: 30, color: white),
      ),
      bottomNavigationBar: BottomAppBar(child: Text("hello")),
    );
  }
}

Future<bool> pickAndLoadJsonFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      String content;

      if (kIsWeb || result.files.single.bytes != null) {
        // Web: Read file bytes
        content = utf8.decode(result.files.single.bytes!);
      } else {
        // Desktop & Mobile: Read file from path
        File file = File(result.files.single.path!);
        content = await file.readAsString();
      }

      if (content.trim().isEmpty) {
        print("Error: JSON file is empty.");
        return false;
      }

      Map<String, dynamic> jsonData = jsonDecode(content);
      print(jsonData); // Process JSON data
      return true;
    } else {
      print('File selection canceled');
      return false;
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Icon getRandomIcon() {
  List<IconData> icons = [
    Icons.access_alarm,
    Icons.accessibility,
    Icons.accessibility_new,
    Icons.account_balance,
    Icons.account_balance_wallet,
    Icons.account_box,
    Icons.account_circle,
    Icons.add,
    Icons.add_a_photo,
    Icons.add_alarm,
    Icons.add_box,
    Icons.add_circle,
    Icons.add_circle_outline,
    Icons.add_comment,
    Icons.add_location,
    Icons.add_photo_alternate,
    Icons.add_shopping_cart,
    Icons.adjust,
    Icons.airline_seat_flat,
    Icons.airline_seat_flat_angled,
    Icons.airline_seat_individual_suite,
    Icons.airline_seat_legroom_extra,
    Icons.airline_seat_legroom_reduced,
    Icons.airline_seat_recline_extra,
    Icons.airline_seat_recline_normal,
    Icons.airplanemode_active,
    Icons.airplanemode_inactive,
    Icons.airplay,
    Icons.alarm,
    Icons.alarm_add,
    Icons.alarm_off,
    Icons.alarm_on,
    Icons.album,
    Icons.all_inbox,
    Icons.all_out,
    Icons.alternate_email,
    Icons.arrow_back,
    Icons.arrow_back_ios,
    Icons.arrow_circle_down,
    Icons.arrow_circle_up,
    Icons.arrow_downward,
    Icons.arrow_forward,
    Icons.arrow_forward_ios,
    Icons.arrow_left,
    Icons.arrow_right,
    Icons.arrow_right_alt,
    Icons.arrow_upward,
    Icons.art_track,
    Icons.aspect_ratio,
    Icons.assistant,
    Icons.assistant_photo,
    Icons.atm,
    Icons.attach_file,
    Icons.attach_money,
    Icons.audiotrack,
    Icons.autorenew,
    Icons.av_timer,
    Icons.backspace,
    Icons.badge,
    Icons.ballot,
    Icons.bar_chart,
    Icons.batch_prediction,
    Icons.beach_access,
    Icons.bed,
    Icons.bedtime,
    Icons.beenhere,
    Icons.bento,
    Icons.book,
    Icons.bookmark,
    Icons.bookmark_border,
    Icons.border_all,
    Icons.border_bottom,
    Icons.border_clear,
    Icons.border_color,
    Icons.border_horizontal,
    Icons.border_inner,
    Icons.border_left,
    Icons.border_outer,
    Icons.border_right,
    Icons.border_style,
    Icons.border_top,
    Icons.border_vertical,
    Icons.cabin,
    Icons.cable,
    Icons.cached,
    Icons.cake,
    Icons.calendar_today,
    Icons.calendar_view_day,
    Icons.camera,
    Icons.camera_alt,
    Icons.camera_enhance,
    Icons.camera_front,
    Icons.camera_rear,
    Icons.camera_roll,
    Icons.cancel,
    Icons.cancel_presentation,
    Icons.card_giftcard,
    Icons.card_membership,
    Icons.card_travel,
    Icons.casino,
    Icons.cast,
    Icons.cast_connected,
    Icons.center_focus_strong,
    Icons.center_focus_weak,
    Icons.change_history,
    Icons.chat,
    Icons.chat_bubble,
    Icons.chat_bubble_outline,
    Icons.check,
    Icons.check_box,
    Icons.check_box_outline_blank,
    Icons.check_circle,
    Icons.check_circle_outline,
    Icons.chevron_left,
    Icons.chevron_right,
    Icons.child_care,
    Icons.child_friendly,
    Icons.chrome_reader_mode,
    Icons.class_,
    Icons.clear,
    Icons.clear_all,
    Icons.close,
    Icons.closed_caption,
    Icons.closed_caption_disabled,
    Icons.cloud,
    Icons.cloud_circle,
    Icons.cloud_done,
    Icons.cloud_download,
    Icons.cloud_off,
    Icons.cloud_queue,
    Icons.cloud_upload,
    Icons.code,
    Icons.code_off,
    Icons.collections,
    Icons.collections_bookmark,
    Icons.color_lens,
    Icons.colorize,
    Icons.comment,
    Icons.comment_bank,
    Icons.comments_disabled,
    Icons.compare,
    Icons.compare_arrows,
    Icons.computer,
    Icons.connect_without_contact,
    Icons.contact_mail,
    Icons.contact_phone,
    Icons.contacts,
    Icons.content_copy,
    Icons.content_cut,
    Icons.content_paste,
    Icons.control_camera,
    Icons.control_point,
    Icons.control_point_duplicate,
    Icons.credit_card,
    Icons.dashboard,
    Icons.dashboard_customize,
    Icons.data_usage,
    Icons.date_range,
    Icons.dehaze,
    Icons.delete,
    Icons.delete_forever,
    Icons.delete_outline,
    Icons.density_large,
    Icons.density_medium,
    Icons.density_small,
    Icons.departure_board,
    Icons.description,
    Icons.design_services,
    Icons.details,
    Icons.developer_board,
    Icons.developer_mode,
    Icons.device_hub,
    Icons.device_unknown,
    Icons.dialer_sip,
    Icons.dialpad,
    Icons.dining,
    Icons.dnd_forwardslash,
    Icons.dock,
    Icons.domain,
    Icons.done,
    Icons.done_all,
    Icons.done_outline,
    Icons.donut_large,
    Icons.donut_small,
    Icons.double_arrow,
    Icons.download,
    Icons.download_done,
    Icons.download_for_offline,
    Icons.drag_indicator,
    Icons.drive_eta,
    Icons.dvr,
    Icons.edit,
    Icons.edit_location,
    Icons.edit_off,
    Icons.eject,
    Icons.email,
    Icons.email_sharp,
    Icons.equalizer,
    Icons.error,
    Icons.error_outline,
    Icons.escalator,
    Icons.escalator_warning,
    Icons.event,
    Icons.event_available,
    Icons.event_busy,
    Icons.event_note,
    Icons.event_seat,
    Icons.exit_to_app,
    Icons.expand,
    Icons.expand_less,
    Icons.expand_more,
    Icons.explore,
    Icons.explore_off,
    Icons.exposure,
    Icons.exposure_neg_1,
    Icons.exposure_neg_2,
    Icons.exposure_plus_1,
    Icons.exposure_plus_2,
    Icons.extension,
    Icons.face,
    Icons.fast_forward,
    Icons.fast_rewind,
    Icons.fastfood,
    Icons.favorite,
    Icons.favorite_border,
    Icons.featured_play_list,
    Icons.featured_video,
    Icons.feedback,
    Icons.fiber_dvr,
    Icons.fiber_manual_record,
    Icons.fiber_new,
    Icons.fiber_pin,
    Icons.fiber_smart_record,
    Icons.file_copy,
    Icons.file_download,
    Icons.file_download_done,
    Icons.file_open,
    Icons.file_present,
    Icons.file_upload,
    Icons.filter,
    Icons.filter_1,
    Icons.filter_2,
    Icons.filter_3,
    Icons.filter_4,
    Icons.filter_5,
    Icons.filter_6,
    Icons.filter_7,
    Icons.filter_8,
    Icons.filter_9,
  ];

  var randomIndex = Random().nextInt(icons.length);
  return Icon(icons[randomIndex], color: Colors.white);
}
