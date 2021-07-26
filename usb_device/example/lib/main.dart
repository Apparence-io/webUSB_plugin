import 'package:flutter/material.dart';
import 'main_presenter.dart';
import 'main_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

abstract class MainView {
  void refresh() {}

  void showToast(String message) {}
}

class MainPage extends StatefulWidget {
  MainPage({
    Key? key,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> implements MainView {
  bool _didInitState = false;
  late MainPresenter presenter;
  late MainViewModel? model;

  @override
  @mustCallSuper
  void didChangeDependencies() {
    if (!_didInitState) {
      afterViewInit();
      _didInitState = true;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    this.presenter.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    this.presenter = MainPresenter(
      MainViewModel(),
      this,
    ).init();
    this.model = this.presenter.viewModel;
  }

  void afterViewInit() {
    this.presenter.initServices();
    this.presenter.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebUSB"),
      ),
      body: this.model!.isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text("Web USB supported: " +
                        this.model!.isSupported.toString()),
                  ),
                  SizedBox(height: 20.0),
                  if (this.model!.pairedDevice != null)
                    this._buildPairedDeviceInfo()
                  else
                    this._buildRequestDeviceButton()
                ],
              ),
            ),
      floatingActionButton: AnimatedOpacity(
        child: FloatingActionButton(
          child: this.presenter.isDeviceOpen()
              ? Icon(Icons.close)
              : Icon(Icons.usb),
          tooltip: "Start session",
          onPressed: () {
            if (this.presenter.isDeviceOpen()) {
              this.presenter.closeSession();
            } else {
              this.presenter.startSession();
            }
          },
        ),
        duration: Duration(milliseconds: 100),
        opacity: this.model!.fabIsVisible ? 1 : 0,
      ),
    );
  }

  Widget _buildPairedDeviceInfo() {
    Map<String, dynamic> _deviceInfos = this.presenter.getPairedDeviceInfo();
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 400,
            child: ListView(
                shrinkWrap: true,
                children: _deviceInfos.keys.map(
                  (String property) {
                    return Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            property,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                          child: Text(
                            '${_deviceInfos[property]}',
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                      ],
                    );
                  },
                ).toList()),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestDeviceButton() {
    return ElevatedButton(
      onPressed: () {
        return this.model!.isLoading ? null : this.presenter.requestDevices();
      },
      child: const Text('Request Device'),
    );
  }

  @override
  void refresh() => this.setState(() {});

  @override
  void showToast(String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
