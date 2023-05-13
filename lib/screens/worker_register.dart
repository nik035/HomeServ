import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:manpower_management_app/screens/worker_home.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:video_player/video_player.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_database/firebase_database.dart';


class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _image;
  File? _resume;
  File? _criminalRecord;
  PDFView? _pdfViewer;
  // PDFView? _pdf;

  File? _videoFile;
  VideoPlayerController? _videoPlayerController;
  // final _database = FirebaseDatabase.instance.ref();

  // Future<void> _uploadVideo(File? videoFile) async {
  //   if (videoFile == null) {
  //     return;
  //   }
  //
  //   // Get a reference to the node where you want to store the video file
  //   final reference = _database.child('videos').push();
  //
  //   // Upload the file to Firebase Storage and get its download URL
  //   final storageRef = FirebaseStorage.instance.ref().child('videos/${reference.key}.mp4');
  //   final uploadTask = storageRef.putFile(videoFile!);
  //   final snapshot = await uploadTask.whenComplete(() {});
  //
  //   final downloadUrl = await snapshot.ref.getDownloadURL();
  //
  //   // Store the download URL in the Realtime Database
  //   await reference.set(downloadUrl);
  // }


  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
        _videoPlayerController = VideoPlayerController.file(_videoFile!);
        _videoPlayerController!.initialize().then((_) {
          setState(() {});
        });
      });
      // await _uploadVideo(_videoFile);
    }
  }

  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  Future<void> _pickResume() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null || result.files.isEmpty) return;
    final file = File(result.files.single.path!);
    setState(() {
      _resume = file;
      _pdfViewer = PDFView(
        filePath: _resume?.path,
        fitEachPage: true,
        pageFling: true,
        defaultPage: 0,
        fitPolicy: FitPolicy.BOTH,
        onPageChanged: (page, total) {
          print('page change: $page/$total');
        },
      );
    });
    // final storageRef = FirebaseStorage.instance.ref().child('resumes/${DateTime.now().millisecondsSinceEpoch}.pdf');
    // final uploadTask = storageRef.putFile(file);
    // final snapshot = await uploadTask.whenComplete(() {});
    // final downloadUrl = await snapshot.ref.getDownloadURL();
    // await FirebaseDatabase.instance.ref().child('users').child('123').child('resumeUrl').set(downloadUrl);
  }
  Future<void> _pickcriminal() async {
    final resul = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (resul == null || resul.files.isEmpty) return;
    final file = File(resul.files.single.path!);
    setState(() {
      _criminalRecord = file;
      _pdfViewer = PDFView(
        filePath: _criminalRecord?.path,
        fitEachPage: true,
        pageFling: true,
        defaultPage: 0,
        fitPolicy: FitPolicy.BOTH,
        onPageChanged: (page, total) {
          print('page change: $page/$total');
        },
      );
    });
      // final storageRef = FirebaseStorage.instance.ref().child('Criminalrecord/${DateTime.now().millisecondsSinceEpoch}.pdf');
      // final uploadTask = storageRef.putFile(file);
      // final snapshot = await uploadTask.whenComplete(() {});
      // final downloadUrl = await snapshot.ref.getDownloadURL();
      // await FirebaseDatabase.instance.ref().child('users').child('123').child('CRUrl').set(downloadUrl);

  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServicePage(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length != 10) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick Photo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent, // set the background color
                  ),
                ),
                SizedBox(height: 30),
                if (_image != null) ...[
                  Image.file(_image!),
                  SizedBox(height: 8),
                ],
                ElevatedButton(
                  onPressed: _pickResume,
                  child: Text('Resume'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent, // set the background color
                  ),
                ),
                //
                Container(
                  height: 50,
                  width: 100,
                  child: _pdfViewer ?? Text('No file selected'),
                ),
                ElevatedButton(
                  onPressed: _pickcriminal,
                  child: Text('No Criminal Record'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent, // set the background color
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: _pdfViewer ?? Text('No file selected'),
                ),
                ElevatedButton(
                  onPressed: _pickVideo,
                  child: Text('Introduction Video'),
                ),
                if (_videoPlayerController != null &&
                    _videoPlayerController!.value.isInitialized)
                  AspectRatio(
                    aspectRatio: _videoPlayerController!.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController!),
                  ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[50], // set the background color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
