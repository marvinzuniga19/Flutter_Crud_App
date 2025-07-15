import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _allData = [];

  var _isLoading = true;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    // Aquí llamarías a tu base de datos para traer los datos
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
  }

  void _showBottomSheet(int? id) {
    if (id != null) {
      final existingData = _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descriptionController.text = existingData['description'];
    } else {
      _titleController.clear();
      _descriptionController.clear();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 5,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (id == null) {
                    _addData();
                  } else {
                    _updateData(id);
                  }
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'Add' : 'Update'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addData() {
    setState(() {
      _allData.add({
        'id': DateTime.now().millisecondsSinceEpoch,
        'title': _titleController.text,
        'description': _descriptionController.text,
      });
    });
  }

  void _updateData(int id) {
    final index = _allData.indexWhere((element) => element['id'] == id);
    if (index != -1) {
      setState(() {
        _allData[index]['title'] = _titleController.text;
        _allData[index]['description'] = _descriptionController.text;
      });
    }
  }

  void _deleteData(int id) {
    setState(() {
      _allData.removeWhere((element) => element['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 74, 209),
        title: const Text('Gestor de Tareas',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: false,

        
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _allData.isEmpty
              ? const Center(child: Text('No data yet.'))
              : ListView.builder(
                  itemCount: _allData.length,
                  itemBuilder: (context, index) {
                    final item = _allData[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: ListTile(
                        title: Text(
                          item['title'],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(item['description']),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _showBottomSheet(item['id']),
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteData(item['id']),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(null),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
        backgroundColor: const Color.fromARGB(255, 197, 196, 228),
        child: const Icon(Icons.add),
      ),
    );
  }
}
