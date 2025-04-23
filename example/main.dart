import 'package:flutter/material.dart';
import 'package:m_components/m_components.dart';

void main(){
  // Initialize MComponents with global settings
  MWidgetConfig.initialize(
    mainColor: Colors.purple,
    locale: const Locale('en'),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MComponents Examples',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
        fontFamily: MWidgetConfig().fontFamily,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State variables for the different components
  bool _toggleValue = false;
  int _stepperValue = 1;
  String? _selectedItem;
  bool _isLoading = false;
  bool _passwordVisible = true;
  int _selectedOption = 0;
  String? _selectedOption2;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Sample data for picker
  final List<String> _items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
  ];
  // Sample options for MRadio
  final List<String> _radioOptions = ['Option 1', 'Option 2', 'Option 3'];

  @override
  void initState() {
    super.initState();
    _selectedItem = _items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // MAppBar example
      appBar: MAppBar(
        title: 'All MComponents',
        mainColor: MWidgetConfig().mainColor,
        backAction: () => Navigator.pop(context),
        trailingWidgets: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                  title: const Text('About MComponents'),
                  content: const Text(
                    'This screen demonstrates all flutter components in a single view.',
                  ),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      // Main body with all components
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            const MLabelledText(
              label: 'TEXT FIELD',
              value: 'Input with label and custom styling',
            ),
            const SizedBox(height: 8),

            // MButton examples
            Row(
              children: [
                Expanded(
                  child: MButton(
                    label: 'FILLED',
                    mainColor: MWidgetConfig().mainColor,
                    buttonFunc: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MButton(
                    label: 'OUTLINED',
                    mainColor: MWidgetConfig().mainColor,
                    showOutline: true,
                    buttonFunc: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // MButton with loading state
            MButton(
              label: 'LOAD DATA',
              mainColor: Colors.blue,
              isLoading: _isLoading,
              icon: Icons.download,
              buttonFunc: () {
                setState(() => _isLoading = true);
                Future.delayed(const Duration(seconds: 2), () {
                  if (mounted) setState(() => _isLoading = false);
                });
              },
            ),
            const SizedBox(height: 24),

            // MTextField example
            MTextField(
              hintText: 'Enter your username',
              textEditingController: nameController,
            ),
            MTextField(
              hintText: 'Enter your password',
              textEditingController: passwordController,
              obscureText: _passwordVisible,
              obscureTextFunction: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },

            ),
            const SizedBox(height: 24),

            // MToggle example
            MToggle(
              description: 'ENABLE NOTIFICATIONS',
              toggleValue: _toggleValue,
              updateFunc: (value) => _toggleValue = value,
            ),
            const SizedBox(height: 24),

            // MStepper example
            MStepper(
              mainColor: MWidgetConfig().mainColor,
              quantity: _stepperValue,
              updateQuantity:
                  (value) => setState(() => _stepperValue = value.toInt()),
              qtyLimit: 10,
              height: 35,
              width: 200,
              description: 'QUANTITY',
            ),
            const SizedBox(height: 24),

            // MPicker example
            MPicker(
              modalTitle: "Select Fruit",
              selectedValue: _selectedItem,
              values: _items,
              updateValue:
                  (value) => setState(() => _selectedItem = value as String),
              mainColor: MWidgetConfig().mainColor,
              deleteAction: () => setState(() => _selectedItem = null),
            ),
            const SizedBox(height: 24),

            // MPlaceholder example
            const MPlaceholder(
              icon: Icons.image_not_supported,
              placeholderText: 'No images found in this gallery',
              resetButtonLabel: 'BROWSE IMAGES',
            ),
            const SizedBox(height: 16),

            // MRadio example
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MText(
                  'SELECTED OPTION: ${_radioOptions[_selectedOption]}',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                MRadio(
                  buttons: _radioOptions,
                  selected: _selectedOption,
                  update: (value) => setState(() => _selectedOption = value,),
                ),
                ...List.generate(_radioOptions.length, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      MRadio2<String?>(
                        value: _radioOptions[index] ,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption2 = value;
                          });
                        },
                        groupValue: _selectedOption2,
                        activeBorderColor: MWidgetConfig().mainColor,
                        inactiveBorderColor: MWidgetConfig().mainColor,
                        activeBgColor: MWidgetConfig().mainColor,
                        inactiveBgColor: Colors.white,
                        activeIcon: Icon(Icons.check,color: Colors.white,size: 20,),
                      ),
                      SizedBox(width: 10,),
                      MText(_radioOptions[index]),
                    ],
                  ),
                ),)
              ],
            ),
            const SizedBox(height: 24),

            // MCheckBox example
            const MText(
              'Checkbox',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            MCheckBox(
              onChnage: (val) {
                setState(() {
                  _toggleValue = val;
                });
              },
              initVal: _toggleValue,
            ),
            const SizedBox(height: 24),

            // MDropdownButton example
            const MText(
              'Dropdown Button',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            MDropdownButton(
              onChanged: (value) {
                setState(() {
                  _selectedOption2 = value;
                });
              },
              dropdownItems: _radioOptions,
              value: _selectedOption2,
              hint: "Select Value",
            ),
            const SizedBox(height: 24),

            // MLoader example
            const MText(
              'MLoader',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            MLoader(),
            MLoader(type: MLoaderType.ios,),
            MLoader(type: MLoaderType.square,),
            const SizedBox(height: 24),

            // MCupertinoBox example
            const MText(
              'CUPERTINO BOX',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                MCupertinoBox(
                  isFirst: true,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: MText('First Item in List', fontSize: 16),
                  ),
                ),
                MCupertinoBox(
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: MText('Middle Item in List', fontSize: 16),
                  ),
                ),
                MCupertinoBox(
                  isLast: true,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: MText('Last Item in List', fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // MCupertinoExpandableBox example
            const MText(
              'CUPERTINO EXPANDABLE BOX',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            MCupertinoExpandableBox(
              title: 'Tap to Expand/Collapse',
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText('This is expandable content', fontSize: 16),
                    const SizedBox(height: 8),
                    MText(
                      'You can add any widgets here that will be shown or hidden when the user taps the header.',
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Example of multiple expandable boxes in a group
            const MText(
              'GROUPED EXPANDABLE BOXES',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                MCupertinoExpandableBox(
                  title: 'Section 1',
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: MText('Content for Section 1', fontSize: 16),
                  ),
                ),
                MCupertinoExpandableBox(
                  title: 'Section 2',
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: MText('Content for Section 2', fontSize: 16),
                  ),
                ),
                MCupertinoExpandableBox(
                  title: 'Section 3',
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: MText('Content for Section 3', fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
