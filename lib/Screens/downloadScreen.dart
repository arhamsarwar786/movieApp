// import 'package:flutter/material.dart';
// // import 'package:flutter_file_downloading/download_provider.dart';
// import 'package:provider/provider.dart';
// import 'download_provider.dart';

// class DownloadScreen extends StatefulWidget {
//   final link;
//   DownloadScreen([this.link]);
//   @override
//   _DownloadScreenState createState() => _DownloadScreenState();
// }

// class _DownloadScreenState extends State<DownloadScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var fileDownloaderProvider =
//         Provider.of<FileDownloaderProvider>(context, listen: false);
//     return new Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.black, title: Text("File Downloading")),
//         body: Container(
//             child: Center(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(onPressed: (){
//         fileDownloaderProvider.dispose();

//                 },),
//                 dowloadButton(fileDownloaderProvider),
//                 downloadProgress()
//               ]),
//         )));
//   }

//   Widget dowloadButton(FileDownloaderProvider downloaderProvider) {
//     return new FlatButton(
//       onPressed: () {
//         downloaderProvider
//             .downloadFile(
//                 "${widget.link['_dool_url']}",
//                 "${widget.link['title']}.mp4")

//             .then((onValue) {});
//       },
//       textColor: Colors.black,
//       color: Colors.redAccent,
//       padding: const EdgeInsets.all(8.0),
//       child: new Text(
//         "Download File",
//       ),
//     );
//   }

//   Widget downloadProgress() {
//     var fileDownloaderProvider =
//         Provider.of<FileDownloaderProvider>(context, listen: true);

//     return new Text(
//       downloadStatus(fileDownloaderProvider),
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     );
//   }

//   downloadStatus(FileDownloaderProvider fileDownloaderProvider) {
//     var retStatus = "";

//     switch (fileDownloaderProvider.downloadStatus) {
//       case DownloadStatus.Downloading:
//         {
//           retStatus = "Download Progress : " +
//               fileDownloaderProvider.downloadPercentage.toString() +
//               "%";
//         }
//         break;
//       case DownloadStatus.Completed:
//         {
//           retStatus = "Download Completed";
//         }
//         break;
//       case DownloadStatus.NotStarted:
//         {
//           retStatus = "Click Download Button";
//         }
//         break;
//       case DownloadStatus.Started:
//         {
//           retStatus = "Download Started";
//         }
//         break;
//     }

//     return retStatus;
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

import 'download_provider.dart';
// import 'movieSc.dart';

class Download extends StatefulWidget {
  final allMoviesData, link;

  Download([this.allMoviesData, this.link]);

  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  var downloadKey, downloadVal;
  var fileDownloaderProvider;
  // var obj = FileDownloaderProvider();
  @override
  void initState() {
    super.initState();

    // obj.downloadedFile;



    fileDownloaderProvider =
        Provider.of<FileDownloaderProvider>(context, listen: false);
   if(widget.link != null)  downloadButton(fileDownloaderProvider);
// fileDownloaderProvider.download
    // setState(() {});
  }



  initFun() async{
      downloadKey.put('${widget.allMoviesData['original_title']}',{
        ""
      });
    
    
  }

  downloadButton(FileDownloaderProvider downloaderProvider) {
    // return new FlatButton(
    //   onPressed: () {

    var url = widget.link['_dool_url'].toString().replaceAll("http", "https");
    downloaderProvider
        .downloadFile(
            // "https://gdplyr.2all.net/stream/720/Chi7Q2Mtdob3mKX.mp4",
            "$url",
            "${widget.link['title']}.mp4")
        .then((onValue) {
          print("Come Here");
        });

    // print(onValue);

    // downloaderProvider.
    // },
    // textColor: Colors.black,
    // color: Colors.redAccent,
    // padding: const EdgeInsets.all(8.0),
    // child: new Text(
    //   "Download File",
    // ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fileDownloaderProvider =
                Provider.of<FileDownloaderProvider>(context, listen: false);
            downloadButton(fileDownloaderProvider);

            // downloadButton(fileDownloaderProvider);
          },
        ),
        backgroundColor: Color(0x67414040),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.amber,
            ),
          ),
          backgroundColor: Colors.black,
          title: Text(
            "DOWNLOAD",
            style: TextStyle(color: Colors.amber, fontSize: 22),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(widget.link);
            },
          ),
        ));
  }
}

class ListItem extends StatelessWidget {
  final link;
  ListItem([this.link]);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Center(
            child: Container(
              // width: ,
              height: size.height / 4.8,
            ),
          ),
          Positioned(
              left: size.width / 40,
              bottom: size.height / 900,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                height: size.height / 3.1,
                width: size.width * 0.9544,
              )),
          Positioned(
            right: size.width / 50,
            top: size.height / 39,
            child: Container(
              // height: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${link['title']}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    "Advencher,Drama, Family",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: size.height / 100,
                    child: downloadProgress(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.download_outlined,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Download(),
                              ),
                            );
                          }),
                      IconButton(
                          icon: Icon(Icons.star_border_outlined),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MovieSc(),
                            //   ),
                            // );
                          }),
                    ],
                  )
                ],
              ),
              width: size.width / 2,
            ),
          ),
          // Positioned(
          //   left: size.width / 60,
          //   top: size.height / 45,
          //   bottom: size.width / 40,
          //   child: Container(
          //     child: Image.network(
          //         "https://static.wikia.nocookie.net/jumanji/images/1/1b/Jumanji_2017_Poster.jpg/revision/latest?cb=20181023182751"),
          //     width: 150,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget downloadProgress() {
    Builder(builder: (context) {
      var fileDownloaderProvider =
          Provider.of<FileDownloaderProvider>(context, listen: true);

      return Text(
        downloadStatus(fileDownloaderProvider),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    });
  }

  downloadStatus(FileDownloaderProvider fileDownloaderProvider) {
    var retStatus = "";

    switch (fileDownloaderProvider.downloadStatus) {
      case DownloadStatus.Downloading:
        {
          retStatus = "Download Progress : " +
              fileDownloaderProvider.downloadPercentage.toString() +
              "%";
        }
        break;
      case DownloadStatus.Completed:
        {
          retStatus = "Download Completed";
        }
        break;
      case DownloadStatus.NotStarted:
        {
          retStatus = "Click Download Button";
        }
        break;
      case DownloadStatus.Started:
        {
          retStatus = "Download Started";
        }
        break;
    }

    return retStatus;
  }
}
