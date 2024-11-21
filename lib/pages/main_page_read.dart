import "dart:io";

import "package:flutter/material.dart";
import "package:pdf_read/pages/page_pdf_view.dart";
import "../components/choose_file.dart";

class MainPageFiles extends StatelessWidget {
  const MainPageFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leitor de Pdf", style:TextStyle(color: Color.fromARGB(255, 242, 242, 245), fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 66, 4, 77),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Por favor clique no botão abaixo e escolha o arquivo que deseja visualizar."),
              ElevatedButton(
                onPressed: () async {
                  final file = await PDFService.selectFile();
                  // ignore: use_build_context_synchronously
                  openFile(context, file);
                },
                child:const Text("Selecionar PDF")
              )
            ],
          ),
        ),
      ),
      );
  }
  void openFile(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PagePdfView(filePdf: file))
  );
}