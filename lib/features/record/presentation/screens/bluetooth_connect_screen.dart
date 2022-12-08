library bluetooth_connect_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/features/record/presentation/index.dart';
import 'package:transcriber/managers/locator/locator.dart';
import 'package:transcriber/managers/navigation/app_router.dart';
import 'package:transcriber/utils/utils.dart';

/// A stateless widget that renders BluetoothConnectScreen.
class BluetoothConnectScreen extends StatefulWidget with AutoRouteWrapper {
  const BluetoothConnectScreen({super.key});

  @override
  State<BluetoothConnectScreen> createState() => _BluetoothConnectScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BluetoothConnectCubit>(),
      child: BlocListener<BluetoothConnectCubit, BluetoothConnectState<dynamic>>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (c, s) => s.status.fold(
          (error) => ToastManager.custom(msg: error, context: c),
          (_) {},
        ),
        child: this,
      ),
    );
  }
}

class _BluetoothConnectScreenState extends State<BluetoothConnectScreen> {
  late BluetoothConnectCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<BluetoothConnectCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => purchaseMicDialog());
    super.initState();
  }

  void purchaseMicDialog() {
    Utils.showAlertDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AdaptiveAlertdialog(
        content: 'WOULD YOU LIKE TO BUY OUR MIC?',
        titleMaxLines: 2,
        titleHeight: 0.05.h,
        leadingButtonConfig: (d) => d.copyWith(
          text: 'NO',
          onPressed: () => navigator.pop(),
        ),
        trailingButtonConfig: (d) => d.copyWith(
          text: 'YES',
          autoPop: false,
          onPressed: () async {
            ToastManager.custom(msg: 'Our Mics are coming soon! We will notify you.', context: context);
            return navigator.popUntil((r) => r.settings.name == BluetoothConnectRoute.name);
          },
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() async {
    final isSupported = await _cubit.isBluetoothSupported;
    if (!isSupported) {
      ToastManager.custom(msg: 'Bluetooth is not supported on this device', context: context);
      WidgetsBinding.instance.endOfFrame.then((_) => navigator.pop());
    } else {
      await PermissionManager.requestBluetooth();
      _cubit.watchBluetoothState();
    }
    super.didChangeDependencies();
  }

  void toggle(AnyBluetoothDevice<dynamic> device) async {
    final isConnected = await _cubit.isDeviceConnected(device);

    if (isConnected) {
      return Utils.showAlertDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => ReactiveAdaptiveAlertdialog<BluetoothConnectCubit, BluetoothConnectState<dynamic>>.value(
          bloc: _cubit,
          dialog: (_, s) => AdaptiveAlertdialog(
            title: 'Disconnect',
            content: 'Are you sure you want to disconnect from ${device.name(device.id.value)}?',
            leadingButtonConfig: (d) => d.copyWith(
              text: 'Cancel',
              // disabled: s.isConnecting,
              onPressed: () => _cubit.cancelConnect(device),
            ),
            trailingButtonConfig: (d) => d.copyWith(
              text: 'Disconnect',
              autoPop: false,
              disabled: s.isConnecting,
              isLoading: s.isConnecting,
              onPressed: () async {
                await _cubit.disconnect(device);
                return navigator.popUntil((r) => r.settings.name == BluetoothConnectRoute.name);
              },
            ),
          ),
        ),
      );
    }

    return Utils.showAlertDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ReactiveAdaptiveAlertdialog<BluetoothConnectCubit, BluetoothConnectState<dynamic>>.value(
        bloc: _cubit,
        dialog: (_, s) => AdaptiveAlertdialog(
          title: 'Connect to ${device.name(device.id.value)}',
          content: 'Are you sure you want to connect to ${device.name(device.id.value)}?',
          titleMaxLines: 2,
          titleHeight: 0.05.h,
          leadingButtonConfig: (d) => d.copyWith(
            text: 'Cancel',
            // disabled: s.isConnecting,
            onPressed: () => _cubit.cancelConnect(device),
          ),
          trailingButtonConfig: (d) => d.copyWith(
            text: 'Connect',
            autoPop: false,
            disabled: s.isConnecting,
            isLoading: s.isConnecting,
            onPressed: () async {
              await _cubit.connect(device);
              return navigator.popUntil((r) => r.settings.name == BluetoothConnectRoute.name);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      adaptiveToolbar: AdaptiveToolbar(
        title: 'Wireless Devices',
        actions: [
          BlocBuilder<BluetoothConnectCubit, BluetoothConnectState<dynamic>>(
            bloc: _cubit,
            builder: (c, s) => Visibility(
              visible: s.isBluetoothOn,
              child: Utils.isPlatform(
                material: Visibility(
                  visible: !s.isScanning,
                  replacement: Padding(
                    padding: EdgeInsets.only(right: sidePadding),
                    child: const Center(
                      child: CircularProgressBar.adaptive(width: 24, height: 24, strokeWidth: 2),
                    ),
                  ),
                  child: AdaptiveToolbar.materialToolbarAction(
                    onPressed: _cubit.startScan,
                    icon: Icons.refresh,
                    alignment: Alignment.center,
                    label: 'Refresh',
                    tooltip: 'Refresh',
                  ),
                ),
                cupertino: AdaptiveToolbar.cupertinoToolbarAction(
                  onPressed: _cubit.startScan,
                  icon: const Icon(CupertinoIcons.refresh, size: 20),
                  alignment: Alignment.center,
                  label: 'Refresh',
                  tooltip: 'Refresh',
                ),
              )!,
            ),
          ),
        ],
      ),
      body: BlocSelector<BluetoothConnectCubit, BluetoothConnectState<dynamic>, bool>(
        selector: (s) => s.isBluetoothOn,
        builder: (c, isActive) => CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                Visibility(
                  visible: !isActive,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sidePadding),
                    child: SizedBox(
                      height: 0.3.h,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AdaptiveButton(
                              onPressed: Utils.isPlatform(
                                material: _cubit.turnOn,
                                // cupertino: () => debugPrint('install open settings dep'),
                                cupertino: _cubit.turnOn,
                              ),
                              text: Utils.isPlatform(material: 'Turn On', cupertino: 'Open Settings'),
                              materialData: (d) => d.copyWith(width: 0.5.w),
                              cupertinoData: (d) => d.copyWith(width: 0.5.w),
                            ),
                            //
                            0.02.vsh,
                            //
                            AdaptiveText(
                              'Bluetooth is currently turned Off!',
                              maxLines: 1,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            //
            BlocSelector<BluetoothConnectCubit, BluetoothConnectState<dynamic>, List<AnyBluetoothDevice<dynamic>>>(
              selector: (s) => s.devices,
              builder: (c, devices) => SliverVisibility(
                visible: isActive,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => AdaptiveListTile(
                      onTap: () => toggle(devices[i]),
                      contentPadding: EdgeInsets.symmetric(horizontal: sidePadding),
                      horizontalTitleGap: 0,
                      title: AdaptiveText(
                        '${devices.elementAt(i).name()}',
                        maxLines: 2,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: AdaptiveText(
                        '${devices.elementAt(i).id}',
                        maxLines: 1,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        textColor: Palette.onSurface60,
                      ),
                      trailing: Visibility(
                        visible: devices[i].isConnected,
                        replacement: const SizedBox.shrink(),
                        child: Icon(
                          Icons.check_circle,
                          color: Palette.primary,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    childCount: devices.length,
                  ),
                ),
              ),
            ),
            //
            SliverToBoxAdapter(child: 0.02.vsh).sliverSafeBottom,
          ],
        ),
      ),
    );
  }
}
