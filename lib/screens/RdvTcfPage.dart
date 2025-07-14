import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/top_bar.dart';

class RdvTcfPage extends StatefulWidget {
  const RdvTcfPage({super.key});

  @override
  State<RdvTcfPage> createState() => _RdvTcfPageState();
}

class _RdvTcfPageState extends State<RdvTcfPage> {
  final List<Map<String, String>> allRdvs = const [
    {
      'school': 'Université de Montréal',
      'date': '12 Août 2025',
      'location': 'Montréal',
      'country': 'Canada',
    },
    {
      'school': 'Université Laval',
      'date': '20 Août 2025',
      'location': 'Québec',
      'country': 'Canada',
    },
    {
      'school': 'Université d’Ottawa',
      'date': '28 Août 2025',
      'location': 'Ottawa',
      'country': 'Canada',
    },
  ];

  String? selectedCity;
  DateTime? selectedDate;

  List<Map<String, String>> filteredRdvs = [];

  List<String> get uniqueCities {
    return allRdvs.map((e) => e['location']!).toSet().toList();
  }

  @override
  void initState() {
    super.initState();
    filteredRdvs = List.from(allRdvs);
  }

  void _applyFilters() {
    setState(() {
      filteredRdvs = allRdvs.where((rdv) {
        final matchCity =
            selectedCity == null || rdv['location'] == selectedCity;
        return matchCity;
      }).toList();
    });
  }

  void _resetFilters() {
    setState(() {
      selectedCity = null;
      selectedDate = null;
      filteredRdvs = List.from(allRdvs);
    });
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFD),
      appBar: const TopBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prochains RDV TCF',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),

            // ✅ Filtres Canada + Ville + Date
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedCity,
                    decoration: InputDecoration(
                      labelText: 'Ville',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                    ),
                    items: uniqueCities
                        .map(
                          (city) =>
                              DropdownMenuItem(value: city, child: Text(city)),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                      _applyFilters();
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                ElevatedButton.icon(
                  onPressed: _pickDate,
                  icon: Icon(Icons.date_range, size: 20.sp),
                  label: Text('Date', style: TextStyle(fontSize: 13.sp)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _resetFilters,
                  icon: const Icon(Icons.clear, color: Colors.red),
                  tooltip: 'Réinitialiser les filtres',
                ),
              ],
            ),

            if (selectedDate != null)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  'Date sélectionnée : ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ),

            SizedBox(height: 16.h),

            Expanded(
              child: filteredRdvs.isEmpty
                  ? const Center(
                      child: Text(
                        'Aucun résultat',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredRdvs.length,
                      itemBuilder: (context, index) {
                        final rdv = filteredRdvs[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 6.h),
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              rdv['school']!,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${rdv['location']!}, Canada 🇨🇦',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 13.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '📅 ${rdv['date']!}',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 13.sp,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {
                                // TODO: Redirection vers réservation
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                foregroundColor: Colors.white,
                                minimumSize: Size(80.w, 36.h),
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Text(
                                'Réserver',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
