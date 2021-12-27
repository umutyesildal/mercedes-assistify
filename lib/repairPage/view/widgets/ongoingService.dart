import 'package:flutter/material.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:service_repository/template_repository.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:icons_helper/icons_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OngoingService extends StatefulWidget {
  const OngoingService({Key? key}) : super(key: key);

  @override
  _OngoingServiceState createState() => _OngoingServiceState();
}

class _OngoingServiceState extends State<OngoingService> {
  ServiceEntity service = ServiceEntity(
      service_id: 'ij543kl42',
      gelis_tarihi: '15/12/2021',
      teslim_tarihi: '21/12/2021',
      ownership: 'a3802021',
      bakim_asamasi: 3,
      maintenance: MaintenanceEntity(
          extraServices: ['brakes', 'tires'], serviceType: 'Service A'));
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.onGoingService,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.14,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.estimatedTime,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            service.teslim_tarihi,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.serviceID,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            service.service_id,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CustomSignalTile(
                    isLast: false,
                    isFirst: true,
                    title: 'Motor Bakımı',
                    description:
                        'Motor yağı değişimi ve filtre değişimi. İlerde oluşabilecek hasar için kontrol.',
                    order: 1,
                    order_place: service.bakim_asamasi,
                  ),
                  CustomSignalTile(
                    isLast: false,
                    isFirst: false,
                    title: 'Yakıt Filtresi',
                    description:
                        'Yakıt filtresinin bakımı ve gerekiyorsa yenilenmesi.',
                    order: 2,
                    order_place: service.bakim_asamasi,
                  ),
                  CustomSignalTile(
                    isLast: false,
                    isFirst: false,
                    title: 'Ekstra Servislerin Tamamlanması',
                    description:
                        'Ekstra istenen servisler için yapılan bakımların tamamlanıp düzenlenmesi.',
                    order: 3,
                    order_place: service.bakim_asamasi,
                  ),
                  CustomSignalTile(
                    isLast: false,
                    isFirst: false,
                    title: 'Bakımların Testleri',
                    description:
                        'Yapılan bakımların testlerinin yapılıp doğrulunun kontrol edilmesi.',
                    order: 4,
                    order_place: service.bakim_asamasi,
                  ),
                  CustomSignalTile(
                    isLast: true,
                    isFirst: false,
                    title: 'Servis Tamamlanması',
                    description: 'Servis tamamlandı.',
                    order: 5,
                    order_place: service.bakim_asamasi,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSignalTile extends StatelessWidget {
  const CustomSignalTile(
      {this.isFirst,
      this.isLast,
      this.description,
      this.title,
      this.order,
      this.order_place});
  final bool? isFirst;
  final bool? isLast;
  final String? title;
  final String? description;
  final int? order;
  final int? order_place;
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst!,
      isLast: isLast!,
      alignment: TimelineAlign.start,
      indicatorStyle: IndicatorStyle(
        color: order! > order_place!
            ? Theme.of(context).dividerColor
            : Theme.of(context).iconTheme.color!,
      ),
      afterLineStyle: LineStyle(
        thickness: 3,
        color: order! > order_place!
            ? Theme.of(context).dividerColor
            : Theme.of(context).iconTheme.color!,
      ),
      beforeLineStyle: LineStyle(
        thickness: 3,
        color: order! > order_place!
            ? Theme.of(context).dividerColor
            : Theme.of(context).iconTheme.color!,
      ),
      endChild: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(description!),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
