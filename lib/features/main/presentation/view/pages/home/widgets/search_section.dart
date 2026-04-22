
import '../../../../../../../core/utils/app_imports.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'ابحث عن...',

          prefixIcon: Icon(
            Icons.search,
            color: Colors.green,
          ),

          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(
            Icons.filter_list_sharp
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
               color:  Colors.grey.shade100
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:  BorderSide(
                color:  Colors.grey.shade100
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:  BorderSide(
                color:   Colors.grey.shade100
            ),
          ),
        ),
      ),
    );
  }
}
