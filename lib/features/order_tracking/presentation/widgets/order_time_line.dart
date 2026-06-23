import '../../../../core/enums/order_enum.dart';
import '../../../../core/utils/app_imports.dart';
import '../../data/models/step_model.dart';


class OrderTimeline extends StatefulWidget {
  final OrderStatus status;

  const OrderTimeline({super.key, required this.status});

  @override
  State<OrderTimeline> createState() => _OrderTimelineState();
}

class _OrderTimelineState extends State<OrderTimeline>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int get currentStep {
    switch (widget.status) {
      case OrderStatus.pending:
        return 0;
      case OrderStatus.confirmed:
        return 1;
      case OrderStatus.delivered:
        return 2;
      case OrderStatus.cancelled:
        return -1;
    }
  }

  final steps = [
    StepModel("تم استلام الطلب", "جاري مراجعة الطلب", Icons.shopping_bag_outlined),
    StepModel("تم قبول الطلب", "بدأ تجهيز الطلب", Icons.check_circle_outline),
    StepModel("تم الانتهاء", "انتهاء تجهيز الطلب", Icons.local_shipping_outlined),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get isCancelled => widget.status == OrderStatus.cancelled;
  bool get isDelivered => widget.status == OrderStatus.delivered;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffF7F8FA),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: List.generate(steps.length, (index) {
          final isDone = currentStep > index;
          final isActive = currentStep == index;
          final isLast = index == steps.length - 1;
          final isPending = !isDone && !isActive;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// ================= LEFT TIMELINE =================
              Column(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final pulse =
                      (isActive && !isDelivered)
                          ? 1.0 + (_controller.value * 0.1)
                          : 1.0;
                      return Transform.scale(
                        scale: pulse,
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            /// OUTER STATE
                            gradient: isPending
                                ? null
                                : LinearGradient(
                              colors: isDone
                                  ? [
                                const Color(0xffE8F5FF),
                                const Color(0xffD6EEFF)
                              ]
                                  : isActive
                                  ? [
                                const Color(0xffDFF7FF),
                                const Color(0xffBFEFFF)
                              ]
                                  : [
                                Colors.grey.shade200,
                                Colors.grey.shade100
                              ],
                            ),
                            boxShadow: (isActive && !isDelivered)
                                ? [
                              BoxShadow(
                                color: AppColor.mainColor.withOpacity(0.35),
                                blurRadius: 15,
                                spreadRadius: 2,
                              )
                            ]
                                : [],                          ),
                          child: Center(
                            child: Container(
                              width: 65,
                              height: 65,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isPending
                                    ? Colors.grey.shade200
                                    : isDelivered && index == steps.length - 1
                                    ? Color(0xffEBF9F1)
                                    : const Color(0xffEBF9F1),
                              ),
                              child: Icon(
                                steps[index].icon,
                                size: 28,
                                color: isPending
                                    ? Colors.grey.shade400
                                    : isDelivered && index == steps.length - 1
                                    ? AppColor.mainColor
                                    : AppColor.mainColor,                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  /// LINE
                  if (!isLast)
                    Container(
                      width: 2.5,
                      height: 70,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: isDone
                              ? [Color(0xffEBF9F1),Color(0xffEBF9F1) ]
                              : [Colors.grey.shade300, Colors.grey.shade200],
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 14),

              /// ================= RIGHT CONTENT =================
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isActive
                        ? AppColor.mainColor.withOpacity(0.06)
                        : Colors.white,
                    border: Border.all(
                      color: isActive
                          ? AppColor.mainColor.withOpacity(0.25)
                          : Colors.transparent,
                    ),
                    boxShadow: isActive
                        ? [
                      BoxShadow(
                        color: AppColor.mainColor.withOpacity(0.10),
                        blurRadius: 16,
                      )
                    ]
                        : [],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// TITLE
                      Text(
                          steps[index].title,
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            color: isCancelled
                                ? Colors.red
                                : isDone
                                ? AppColor.mainColor
                                : isActive
                                ? AppColor.mainColor
                                : Colors.grey,
                          )
                      ),

                      const SizedBox(height: 6),

                      /// SUB CHIP
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isActive
                              ? AppColor.mainColor.withOpacity(0.08)
                              : Colors.grey.withOpacity(0.08),
                        ),
                        child: Text(
                            steps[index].subtitle,
                            style:Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: isActive
                                  ? AppColor.mainColor
                                  : Colors.grey.shade600,

                            )

                        ),
                      ),

                      if (isDelivered && index == steps.length - 1) ...[
                        const SizedBox(height: 12),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: const LinearGradient(
                              colors: [Color(0xffEBF9F1), Color(0xffEBF9F1)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.2),
                                blurRadius: 12,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check_circle, size: 16, color: AppColor.mainColor),
                              SizedBox(width: 6),
                              Text(
                                "تم انتهاء الطلب بنجاح",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: AppColor.mainColor,
                                )),
                            ],
                          ),
                        ),
                      ]                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}