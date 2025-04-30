import 'package:flutter/material.dart';

class PantallaSiete extends StatefulWidget {
  const PantallaSiete({Key? key}) : super(key: key);

  @override
  State<PantallaSiete> createState() => _PantallaSieteState();
}

class _PantallaSieteState extends State<PantallaSiete> {
  final List<String> _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, "Item ${_items.length + 1}");
    if (_key.currentState != null) {
      // Null check before accessing currentState
      _key.currentState!.insertItem(
        0,
        duration: const Duration(
            milliseconds: 300), // Reduced duration for smoother animation
      );
    }
  }

  void _removeItem(int index) {
    if (_key.currentState != null) {
      // Null check before accessing currentState
      _key.currentState!.removeItem(
        index,
        (_, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: Card(
              margin: const EdgeInsets.all(10),
              color: Colors.red,
              child: Padding(
                // Added padding for better visual appearance
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Deleted",
                  style: const TextStyle(
                      fontSize: 24, color: Colors.white), // Added color
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
        duration: const Duration(
            milliseconds: 200), // Reduced duration for smoother animation
      );
    }
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pantalla 7 Esquivel', // Changed title to reflect the correct screen
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0089f8),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          ElevatedButton(
            // Changed to ElevatedButton for better styling
            onPressed: _addItem,
            child: const Text('Add Item'), // Added text to the button
          ),
          Expanded(
            child: AnimatedList(
              key: _key,
              initialItemCount: _items.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                // Check if the item exists before trying to display it.  This is crucial!
                if (index < _items.length) {
                  final String item = _items[index]; // Store the item
                  return SizeTransition(
                    key: UniqueKey(), // Added UniqueKey for correct animations
                    sizeFactor: animation,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: Color(0xffe38d24),
                      elevation: 4, // Added elevation for a better look
                      child: ListTile(
                        title: Text(
                          item, // Use the stored item variable
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500), // Improved style
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete,
                              color: Color(0xff9c0000)), //Added color
                          onPressed: () {
                            _removeItem(index);
                          },
                        ),
                      ),
                    ),
                  );
                } else {
                  // Return an empty container if the index is out of bounds.
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
