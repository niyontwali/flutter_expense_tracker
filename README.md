# Expense Tracker Flutter App

## Introduction

Welcome to the Expense Tracker Flutter app! This application is designed to help you manage your expenses efficiently. With its user-friendly interface, you can easily add, edit, and delete expenses, as well as view expense details and summary reports.

## Set Up

To get started with the Expense Tracker app, follow these simple steps:

1. Make sure you have Flutter and Dart installed on your development machine.
2. Clone this repository to your local environment using `git clone`.
3. Open the project in your favorite IDE or code editor.
4. Run `flutter pub get` to install all the required dependencies.
5. Connect a physical device or start an emulator/simulator.
6. Launch the app by executing `flutter run` in the terminal.

## Keywords, Widgets and Classes used Explained

### Keywords:

1. `final`: Declares an immutable variable that can be assigned a value only once. Once assigned, its value cannot be changed.

   ```dart
   final double price = 25.99;
   ```

2. `const`: Declares a compile-time constant variable with a known value that remains constant throughout the app's execution.

   ```dart
   const int daysInAWeek = 7;
   ```

3. `key`: A unique identifier for widgets, enabling widget state persistence and efficient updates in the widget tree.

   ```dart
   Widget build(BuildContext context) {
     return Text(
       "Hello, World!",
       key: Key('helloText'),
     );
   }
   ```

4. `context`: Represents the current location in the widget tree and provides access to various services like localization and theme data.

   ```dart
   void _showSnackBar(BuildContext context) {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Expense added!')),
     );
   }
   ```

5. Initializers: Used to initialize variables, particularly in constructors.

   ```dart
   class Expense {
     final String name;
     final double amount;

     Expense(this.name, this.amount);
   }
   ```

6. Additional Constructors: Allow creating multiple constructors for a class with different parameters.

   ```dart
   class Expense {
     final String name;
     final double amount;

     Expense(this.name, this.amount);

     Expense.fromMap(Map<String, dynamic> map)
         : name = map['name'],
           amount = map['amount'];
   }
   ```

## Classes Explained

7. `debugShowCheckedModeBanner`: A flag to show or hide the "debug" banner at the top-right corner of the app when running in debug mode.

   ```dart
   void main() {
    MaterialApp(
      debugShowCheckedModeBanner: true,
     runApp(MyApp()
     ),
     ),
   }
   ```

8. `darkTheme` and 9. `theme`: Define the dark and light themes of the app, respectively.

   ```dart
   MaterialApp(
     theme: ThemeData.light(),
     darkTheme: ThemeData.dark(),
     home: MyExpenseTrackerApp(),
   );
   ```

## Widgets Used Explained

10. `ScaffoldMessenger`: Show snack bars and other in-app messages. A newer replacement for `Scaffold.of()`.

    ```dart
    void _showSnackBar(BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Expense added!')),
      );
    }
    ```

11. `SnackBar`: Display temporary messages at the bottom of the screen.

    ```dart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense added!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Undo expense addition logic
          },
        ),
      ),
    );
    ```

12. `SnackBarAction`: Represent the action of a `SnackBar`, such as "Undo" in the above example.

    ```dart
    SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Undo logic here
      },
    )
    ```

13. `Duration`: Represents a duration of time, used with animations and timers.

    ```dart
    Timer(Duration(seconds: 2), () {
      // Code to be executed after 2 seconds
    });
    ```

14. `AppBar`: Represents the top app bar in a Scaffold.

    ```dart
    AppBar(
      title: Text('Expense Tracker'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            // Add expense logic
          },
        ),
      ],
    )
    ```

15. `Column` and `Row`: Layout widgets used to arrange child widgets vertically and horizontally, respectively.

    ```dart
    Column(
      children: [
        Text('Expense 1'),
        Text('Expense 2'),
        Text('Expense 3'),
      ],
    )

    Row(
      children: [
        Text('Expense 1'),
        Text('Expense 2'),
        Text('Expense 3'),
      ],
    )
    ```

16. `IconButton`: A button widget with an icon.

    ```dart
    IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        // Add expense logic
      },
    )
    ```

17. `ElevatedButton`: A Material Design elevated button.

    ```dart
    ElevatedButton(
      onPressed: () {
        // Button pressed logic
      },
      child: Text('Save Expense'),
    )
    ```

18. `Expanded`: A widget that expands to fill the available space along the main axis in a `Column` or `Row`.

    ```dart
    Row(
      children: [
        Expanded(child: Text('Expense 1')),
        Expanded(child: Text('Expense 2')),
        Expanded(child: Text('Expense 3')),
      ],
    )
    ```

19. `Spacer`: A widget that takes up available space, forcing its siblings to the opposite side.

    ```dart
    Row(
      children: [
        Text('Expense 1'),
        Spacer(),
        Text('Expense 2'),
      ],
    )
    ```

20. `MediaQuery`: A widget used to get the media query information, such as the screen size and orientation.

    ```dart
    final screenSize = MediaQuery.of(context).size;
    ```

21. `Padding`: A widget used to add padding around its child widget.

    ```dart
    Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('Expense Details'),
    )
    ```

22. `BorderRadius`: A class used to create rounded corners for widgets like `Container`.

    ```dart
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blue,
      ),
      child: Text('Expense Widget'),
    )
    ```

23. `SizedBox`: A box with a specified width, height, or both.

    ```dart
    SizedBox(
      width: 100,
      height: 50,
      child: Text('Box Widget'),
    )
    ```

24. `Text`: A widget used to display text on the screen.

    ```dart
    Text('Expense Name: Grocery')
    ```

25. `Dismissible`: A widget used to make another widget dismissible by swiping.

    ```dart
    Dismissible(
      key: Key(expense.id),
      child: ListTile(
        title: Text(expense.name),
        subtitle: Text('\$${expense.amount}'),
      ),
      onDismissed: (direction) {
      // Delete expense logic
      },
      )
    ```

27. `DropdownButton`: A widget that displays a dropdown menu with selectable options.

    ```dart
    DropdownButton<String>(
      value: selectedCategory,
      onChanged: (String newValue) {
        setState(() {
          selectedCategory = newValue;
        });
      },
      items: <String>['Food', 'Transport', 'Shopping', 'Others']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    )
    ```

28. `ListView`: A scrollable list of widgets.

    ```dart
    ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(expenses[index].name),
          subtitle: Text('\$${expenses[index].amount}'),
        );
      },
    )
    ```

29. `Navigator.pop`: A method used to pop the top route off the navigator's stack.

    ```dart
    void _onSaveExpense() {
      // Save expense logic
      Navigator.pop(context);
    }
    ```

30. `showModalBottomSheet`: A method used to display a bottom sheet.

    ```dart
    void _showAddExpenseBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Text('Add Expense Form'),
          );
        },
      );
    }
    ```

31. `LinearGradient`: A class used to create a gradient with linear interpolation.

    ```dart
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    )
    ```

32. `BoxShape`: An enumeration that defines the different shapes for a `BoxDecoration`.

    ```dart
    Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    )
    ```

33. `FractionallySizedBox`: A widget that sizes its child to a fraction of the total available space.

    ```dart
    FractionallySizedBox(
      widthFactor: 0.8,
      child: Text('80% of the screen width'),
    )
    ```

