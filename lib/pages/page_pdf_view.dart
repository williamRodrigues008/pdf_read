import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_pdfview/flutter_pdfview.dart";
import 'package:path/path.dart';

class PagePdfView extends StatefulWidget {
  final File filePdf;
  const PagePdfView({
    super.key,
    required this.filePdf,
  });


  @override
  _PagePdfViewer createState() => _PagePdfViewer();
}

class _PagePdfViewer extends State<PagePdfView>{
  PDFViewController? controllerPdf;
  int pages = 0;
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.filePdf.path);
    final numberPages = "${pageIndex + 1} de $pages";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          name, 
          style: 
            const TextStyle(
                      color: Color.fromARGB(255, 242, 242, 245), 
                      fontWeight: FontWeight.bold
                    )
          ),
          backgroundColor: const Color.fromARGB(255, 66, 4, 77),
        actions: pages >= 2
        ? [
          Center(child: Text(
            numberPages, 
            style: const TextStyle(
                      color: Color.fromARGB(255, 242, 242, 245), 
                      fontWeight: FontWeight.bold
                    ))),
          IconButton(
            onPressed: (){
              final page = pageIndex == 0 ? pages : pageIndex - 1;
              controllerPdf?.setPage(page);
            },
            icon: const Icon(Icons.chevron_left, size: 32, color: Color.fromARGB(255, 242, 242, 245))
          ),
          IconButton(
            onPressed: (){
              final page = pageIndex == pages -1 ? 0 : pageIndex + 1;
              controllerPdf?.setPage(page);
            },
            icon: const Icon(Icons.chevron_right, size: 32, color: Color.fromARGB(255, 242, 242, 245))
          )
        ]
        : null,
      ),
      body: PDFView(
        filePath:  widget.filePdf.path,
        onRender: (pages) => setState(() => this.pages = pages! ),
        onViewCreated: (controller) => setState(() => controllerPdf = controller),
        onPageChanged: (indexPage, _) => setState(() => pageIndex = indexPage!),
      ),
    );
  }
}
