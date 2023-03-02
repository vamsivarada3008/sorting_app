import 'package:flutter/material.dart';

List<String> _arrayInput = [];

String sortingAlogorithm = "";
List<int> _sortedArray = [];
int _time = 0;

class sortingApp extends StatefulWidget {
  const sortingApp({super.key});

  @override
  State<sortingApp> createState() => _sortingAppState();
}

class _sortingAppState extends State<sortingApp> {
  TextEditingController arraycontroller = TextEditingController();
  setSort(String value) {
    setState(() {
      sortingAlogorithm = value;
    });
  }

  bubbleSort(List<int> list) {
    DateTime startTime = DateTime.now();
    int n = list.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (list[j] > list[j + 1]) {
          int temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }

    DateTime endTime = DateTime.now();
    Duration timeDifference = endTime.difference(startTime);
    setState(() {
      _sortedArray = list;
      _time = timeDifference.inMicroseconds;
    });
    print('Time taken: ${timeDifference.inMilliseconds} ms');
  }

  doMergeSort(List<int> list) {
    DateTime startTime = DateTime.now();
    List<int> sortedList = mergeSort(list);

    DateTime endTime = DateTime.now();
    Duration timeDifference = endTime.difference(startTime);
    setState(() {
      _sortedArray = sortedList;
      _time = timeDifference.inMicroseconds;
    });
  }

  doInsertionSort(List<int> list) {
    DateTime startTime = DateTime.now();
    List<int> sortedList = insertionSort(list);

    DateTime endTime = DateTime.now();
    Duration timeDifference = endTime.difference(startTime);
    setState(() {
      _sortedArray = list;
      _time = timeDifference.inMicroseconds;
    });
  }

  doQuickSort(List<int> list) {
    DateTime startTime = DateTime.now();
    List<int> sortedList = quickSort(list);

    DateTime endTime = DateTime.now();
    Duration timeDifference = endTime.difference(startTime);
    setState(() {
      _sortedArray = sortedList;
      _time = timeDifference.inMicroseconds;
    });
  }

  doCountingSort(List<int> list) {
    DateTime startTime = DateTime.now();
    List<int> sortedList = countingSort2(list);

    DateTime endTime = DateTime.now();
    Duration timeDifference = endTime.difference(startTime);
    setState(() {
      _sortedArray = sortedList;
      _time = timeDifference.inMicroseconds;
    });
  }

  doHeapSort(List<int> list) {
    DateTime startTime = DateTime.now();
    List<int> sortedList = heapSort(list);

    DateTime endTime = DateTime.now();
    Duration timeDifference = endTime.difference(startTime);
    setState(() {
      _sortedArray = sortedList;
      _time = timeDifference.inMicroseconds;
    });
  }

  doRadixSort(List<int> list) {
    DateTime startTime = DateTime.now();
    List<int> sortedList = radixSort(list);

    DateTime endTime = DateTime.now();
    Duration timeDifference = endTime.difference(startTime);
    setState(() {
      _sortedArray = sortedList;
      _time = timeDifference.inMicroseconds;
    });
  }

  doSelectionSort(List<int> list) {
    DateTime startTime = DateTime.now();
    List<int> sortedList = selectionSort(list);

    DateTime endTime = DateTime.now();
    Duration timeDifference = endTime.difference(startTime);
    setState(() {
      _sortedArray = list;
      _time = timeDifference.inMicroseconds;
    });
  }

  @override
  void dispose() {
    arraycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time to sort"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Array",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 3 / 4,
                  child: TextField(
                    controller: arraycontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Add elements with comma",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _arrayInput = value.split(',');
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                child: Text(
              "Input array is $_arrayInput",
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setSort("bubble sort");
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "bubble sort",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: sortingAlogorithm == "bubble sort"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setSort("merge sort");
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "merge sort",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: sortingAlogorithm == "merge sort"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setSort("insertion sort");
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "insertion sort",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: sortingAlogorithm == "insertion sort"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setSort("quick sort");
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "quick sort",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: sortingAlogorithm == "quick sort"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setSort("selection sort");
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "selection sort",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: sortingAlogorithm == "selection sort"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setSort("heap sort");
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "heap sort",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: sortingAlogorithm == "heap sort"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setSort("radix sort");
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "radix sort",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: sortingAlogorithm == "radix sort"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setSort("counting sort");
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "counting sort",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: sortingAlogorithm == "counting sort"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sorted array is: $_sortedArray",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Time taken is: $_time",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<int> intList = _arrayInput.map((s) => int.parse(s)).toList();
          print(intList);
          switch (sortingAlogorithm) {
            case "bubble sort":
              bubbleSort(intList);
              print("bubble sort");

              break;
            case "merge sort":
              doMergeSort(intList);
              print("merge sort");
              break;

            case "quick sort":
              doQuickSort(intList);
              print("quick sort");
              break;
            case "insertion sort":
              doInsertionSort(intList);
              print("insertion sort");
              break;
            case "selection sort":
              doSelectionSort(intList);
              print("selection sort");
              break;
            case "heap sort":
              doHeapSort(intList);
              print("heap sort");
              break;
            case "radix sort":
              doRadixSort(intList);
              print("radix sort");
              break;
            case "radix sort":
              doCountingSort(intList);
              print("counting sort");
              break;
            default:
              print("Invalid case");
          }
        },
        child: Icon(Icons.sort),
      ),
    );
  }
}

List<int> mergeSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }

  int mid = list.length ~/ 2;
  List<int> left = list.sublist(0, mid);
  List<int> right = list.sublist(mid);

  left = mergeSort(left);
  right = mergeSort(right);

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];

  while (left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) {
      result.add(left.removeAt(0));
    } else {
      result.add(right.removeAt(0));
    }
  }

  result.addAll(left);
  result.addAll(right);

  return result;
}

List<int> insertionSort(List<int> list) {
  for (int i = 1; i < list.length; i++) {
    int key = list[i];
    int j = i - 1;

    while (j >= 0 && list[j] > key) {
      list[j + 1] = list[j];
      j--;
    }

    list[j + 1] = key;
  }

  return list;
}

List<int> quickSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }

  int pivot = list[0];
  List<int> left = [];
  List<int> right = [];

  for (int i = 1; i < list.length; i++) {
    if (list[i] < pivot) {
      left.add(list[i]);
    } else {
      right.add(list[i]);
    }
  }

  return [...quickSort(left), pivot, ...quickSort(right)];
}

List<int> selectionSort(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    int minIndex = i;

    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[minIndex]) {
        minIndex = j;
      }
    }

    int temp = list[minIndex];
    list[minIndex] = list[i];
    list[i] = temp;
  }

  return list;
}

List<int> heapSort(List<int> list) {
  int n = list.length;

  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    heapify(list, n, i);
  }

  for (int i = n - 1; i >= 0; i--) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;

    heapify(list, i, 0);
  }

  return list;
}

void heapify(List<int> list, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && list[left] > list[largest]) {
    largest = left;
  }
  if (right < n && list[right] > list[largest]) {
    largest = right;
  }

  if (largest != i) {
    int temp = list[i];
    list[i] = list[largest];
    list[largest] = temp;

    heapify(list, n, largest);
  }
}

List<int> radixSort(List<int> list) {
  int maxElement = list.reduce((a, b) => a > b ? a : b);

  for (int exp = 1; maxElement ~/ exp > 0; exp *= 10) {
    list = countingSort(list, exp);
  }

  return list;
}

List<int> countingSort(List<int> list, int exp) {
  List<int> count = List<int>.filled(10, 0);
  List<int> output = List<int>.filled(list.length, 0);

  for (int i = 0; i < list.length; i++) {
    int digit = (list[i] ~/ exp) % 10;
    count[digit]++;
  }

  for (int i = 1; i < count.length; i++) {
    count[i] += count[i - 1];
  }

  for (int i = list.length - 1; i >= 0; i--) {
    int digit = (list[i] ~/ exp) % 10;
    output[count[digit] - 1] = list[i];
    count[digit]--;
  }

  return output;
}

List<int> countingSort2(List<int> list) {
  int maxElement = list.reduce((a, b) => a > b ? a : b);

  List<int> count = List<int>.filled(maxElement + 1, 0);
  List<int> output = List<int>.filled(list.length, 0);

  for (int i = 0; i < list.length; i++) {
    count[list[i]]++;
  }

  for (int i = 1; i < count.length; i++) {
    count[i] += count[i - 1];
  }

  for (int i = list.length - 1; i >= 0; i--) {
    output[count[list[i]] - 1] = list[i];
    count[list[i]]--;
  }

  return output;
}
