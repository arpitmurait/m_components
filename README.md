# MComponenets

A collection of customizable Flutter widgets designed for rapid UI development. MComponents provides ready-to-use components with consistent styling and behavior.

## Installation

To use this package, add `mcomponents` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  mcomponents: ^latest_version
```

## Configuration

MComponents can be configured globally to maintain consistent styling across all components:

```dart
void main() {
  // Initialize MComponents with your preferred configuration. If no configuration
  // is provided, the default values will be automatically used.
  MWidgetConfig.initialize(
    mainColor: Colors.purple, // Default is Colors.blue
    fontFamily: 'Roboto', // If not specified, will use device's font
    locale: const Locale('it'), // Default is Locale('en')
  );

  runApp(MyApp());
}
```

Components will use these global settings by default, but you can always override them for individual instances:

```dart
MButton(
  label: 'CUSTOM',
  mainColor: Colors.orange,  // This overrides the global mainColor
  buttonFunc: () => buttonFunc(),
)
```

## Components

### MAppBar

A customizable app bar with built-in title, back navigation, and trailing widgets support.

```dart
MAppBar(
  title: 'My App',
  mainColor: Colors.blue,
  backAction: () => Navigator.pop(context),
  trailingWidgets: [
    IconButton(icon: Icon(Icons.settings), onPressed: () {}),
  ],
)
```

**Key Features:**

- Custom title text or widget
- Optional back button with action
- Support for trailing widgets
- Loading state handling
- Customizable colors

### MButton

A versatile button component with support for outlined and filled styles, loading states, icons, and customizable colors.

```dart
MButton(
  label: 'SUBMIT',
  mainColor: Colors.blue,
  textColor: Colors.white, // Custom text color
  buttonFunc: () => handleSubmit(),
  showOutline: true,
  isLoading: false,
  icon: Icons.send, // Optional icon
)
```

**Key Features:**

- Primary and outline styles
- Loading state with automatic spinner
- Uppercase text transformation
- Optional leading icon
- Custom text color support
- Consistent border radius and padding

### MGestureDetector

An enhanced gesture detector that provides haptic feedback and handles both tap and long press actions.

```dart
MGestureDetector(
  onTap: () => handleTap(),
  onLongPress: () => handleLongPress(),
  vibrate: true,
  child: Container(
    // Container
  ),
)
```

**Key Features:**

- Optional haptic feedback
- Support for both tap and long press
- Opaque hit testing behavior
- Simplified API over standard GestureDetector

### MLabelledText

A component for displaying label-value pairs with customizable styling and overflow handling.

```dart
MLabelledText(
  label: 'PRICE',
  value: '$49.99',
  valueColor: Colors.green,
  maxLines: 1,
)
```

**Key Features:**

- Support for label-value formatting
- Customizable colors and font sizes
- Text overflow handling
- Support for multi-line values
- Automatic uppercase labels

### MPicker

A dropdown selector with built-in modal list view for selecting items from a collection.

```dart
MPicker(
  label: 'COUNTRY',
  selectedValue: selectedCountry,
  values: countries,
  updateValue: (value) => setState(() => selectedCountry = value),
  deleteAction: () => setState(() => selectedCountry = null),
)
```

**Key Features:**

- Label and value display
- Modal item selection
- Optional delete button
- Customizable modal title
- Border styling and dropdown indicator

### MPlaceholder

A component for displaying placeholder/empty state messages with optional icon and reset action.

```dart
MPlaceholder(
  icon: Icons.search,
  placeholderText: 'No results found',
  resetAction: () => clearFilters(),
  resetButtonLabel: 'CLEAR FILTERS',
  mainColor: Colors.blue,
)
```

**Key Features:**

- Large icon display
- Customizable message text
- Optional reset button
- Flexible padding configuration
- Centralized layout

### MStepper

A quantity selector with increment/decrement buttons and optional quantity limits.

```dart
MStepper(
  mainColor: Colors.blue,
  quantity: 2,
  updateQuantity: (value) => setState(() => quantity = value),
  qtyLimit: 10,
  description: 'QUANTITY',
  outlined: true,
)
```

**Key Features:**

- Increment/decrement buttons
- Optional quantity limits
- Long press to min/max values
- Optional description label
- Outlined or filled button styles

### MTextField

A customizable text input field with support for various input types, clear button, and optional label.

```dart
MTextField(
  label: 'EMAIL',
  hintText: 'Enter your email',
  initialValue: email,
  maxLines: 5, // Comes with limitations, read the description for more details
  updateValue: (value) => setState(() => email = value),
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next,
  textEditingController: myController, // Optional controller
  obscureText: true, // For password fields
  obscureTextFunction: () => togglePasswordVisibility(), // Toggle password visibility
  readOnly: false,
  submitAction: (value) => submitForm(),
  textCapitalization: true,
  height: 60,
  textAlignVertical: TextAlignVertical.center,
)
```

**Key Features:**

- Optional label
- Clear button when text is present
- Password visibility toggle
- Custom keyboard types and actions
- Read-only mode
- Controller support
- Form submission handler
- Customizable height and text alignment
- Text capitalization options

### MToggle

A switch component with description text and customizable colors.

```dart
MToggle(
  description: 'DARK MODE',
  toggleValue: isDarkMode,
  updateFunc: (value) => setState(() => isDarkMode = value),
  mainColor: Colors.purple,
  readOnly: false,
)
```

**Key Features:**

- Description text with automatic uppercase
- Toggle state management
- Optional read-only mode
- Customizable colors
- Compact design with proper spacing

### MRadio

A customizable radio button group widget with support for text or icon options.

```dart
MRadio(
  buttons: ['Option 1', 'Option 2', 'Option 3'],
  selected: 0,
  update: (value) => setState(() => selectedOption = options[value]),
  mainColor: Colors.purple,
  buttonIcons: [Icons.home, Icons.favorite, Icons.settings], // Optional
)
```

**Key Features:**

- Horizontal radio button layout
- Support for both text and icon labels
- Single selection with clear visual feedback
- Customizable colors
- Automatic border radius handling for first/last items
- Consistent styling with the rest of the library

### MCupertinoBox

A stylized container widget that mimics iOS-style UI elements for consistent Cupertino design.

```dart
// For a single box
MCupertinoBox(
  isFirst: true,
  isLast: true,
  child: Padding(
    padding: EdgeInsets.all(16.0),
    child: Text('Single Item'),
  ),
)

// For a list of boxes
Column(
  children: [
    MCupertinoBox(
      isFirst: true,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('First Item'),
      ),
    ),
    MCupertinoBox(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Middle Item'),
      ),
    ),
    MCupertinoBox(
      isLast: true,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Last Item'),
      ),
    ),
  ],
)
```

**Key Features:**

- iOS-style container styling
- Proper border radius for items in a list (first and last items)
- Automatic borders between adjacent items
- Adaptive background color based on platform brightness
- Simplified creation of Cupertino-styled list groups
- Consistent with iOS design guidelines

### MCupertinoExpandableBox

A customizable expandable box widget with Cupertino styling.

```dart
MCupertinoExpandableBox(
  title: 'Expandable Box',
  child: Padding(
    padding: EdgeInsets.all(16.0),
    child: Text('Expandable Content'),
  ),
  onExpand: () => print('Expanded'),
  mainColor: Colors.blue,
)
```

**Key Features:**

- Collapsible container with a title bar
- Tap to expand or collapse the content
- Indicator icon changes based on the expanded state
- Customizable accent color
- Optional callback for expansion state changes
- Consistent Cupertino styling

### MText

A simple text widget that provides consistent styling and customization options across your application.

```dart
MText(
  'Hello World',
  color: Colors.blue,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
  italic: true,
  height: 1.5,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  textAlign: TextAlign.center,
)
```

**Key Features:**

- Consistent text styling
- Support for custom colors and font sizes
- Optional font weight and family
- Italic text support
- Line height customization
- Text overflow handling
- Text alignment options
- Automatic font family inheritance from MComponentsConfig

## Utilities

MComponents also includes several utility classes:

- **MColors**: Provides color utilities and constants
- **MLocalization**: Simple localization support for internal strings
- **HexColor**: Extension for working with hex color values

## License

This package is available under the MIT License.
