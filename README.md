# Orange Pi 3B - ROS Noetic Packages

Этот репозиторий содержит предварительно скомпилированные пакеты ROS Noetic для архитектуры ARM64, специально разработанные для одноплатных компьютеров Orange Pi 3B под управлением Debian Bookworm (12).

## 📦 Статистика пакетов

- **Всего .deb файлов**: 291
- **Архитектура**: ARM64 (aarch64)
- **Целевая ОС**: Debian Bookworm (12)
- **Дистрибуция ROS**: Noetic Ninjemys
- **Формат пакетов**: Переименованы с Ubuntu Focal на Debian Bookworm
- **Дата обновления**: 2025-09-17

## 🚀 Что включено

Этот репозиторий предоставляет полный набор пакетов для установки ROS Noetic, включая:

### Основные пакеты ROS (10 пакетов)
- `ros-noetic-ros-core` - Основная функциональность ROS
- `ros-noetic-ros-base` - Базовая установка ROS
- `ros-noetic-ros-comm` - Библиотеки коммуникации ROS
- `ros-noetic-ros` - Основной метапакет ROS

### Система коммуникации (20 пакетов)
- roscpp, rospy, rosgraph, rosmaster
- rosparam, rostopic, rosservice, rostest

### Система сборки (10 пакетов)
- catkin, cmake-modules, rospack
- rosmake, rosbuild, rosclean

### Типы сообщений (34 пакетов)
- std-msgs, geometry-msgs, sensor-msgs, nav-msgs
- trajectory-msgs, visualization-msgs и другие

### Библиотека трансформаций (20 пакетов)
- tf, tf2 и все связанные пакеты tf2

### Обработка изображений (22 пакетов)
- cv-bridge, image-transport, camera packages
- opencv-tests

### Утилиты (12 пакетов)
- rosbag, roslaunch, roswtf, rosunit

### Отладочные символы (44 пакетов)
- Пакеты с отладочными символами для разработки

## 🛠 Установка

### Предварительные требования
- Orange Pi 3B с Ubuntu 20.04 (Focal Fossa)
- Архитектура ARM64
- Права root или sudo

### Быстрая установка
```bash
# Установить все пакеты сразу
sudo dpkg -i *.deb

# Исправить проблемы с зависимостями
sudo apt-get install -f
```

### Выборочная установка
```bash
# Установить основные пакеты ROS
sudo dpkg -i ros-noetic-ros-core_*.deb ros-noetic-ros-base_*.deb

# Установить конкретную функциональность
sudo dpkg -i ros-noetic-ros-comm_*.deb
sudo dpkg -i ros-noetic-tf2_*.deb
```

## 📋 Детальная статистика пакетов

### Основные пакеты ROS
- `ros-noetic-ros-base_1.5.0-0bookworm_arm64.deb`
- `ros-noetic-ros-base_1.5.0-0focal_arm64.deb`
- `ros-noetic-ros-comm_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-ros-comm_1.17.4-0focal_arm64.deb`
- `ros-noetic-ros-core_1.5.0-0bookworm_arm64.deb`
- `ros-noetic-ros-core_1.5.0-0focal_arm64.deb`
- `ros-noetic-ros_1.15.10-0bookworm_arm64.deb`
- `ros-noetic-ros_1.15.10-0focal_arm64.deb`
- `ros-noetic-tf2-ros_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2-ros_0.7.10-0focal_arm64.deb`

### Система коммуникации
- `ros-noetic-roscpp-core_0.7.3-0bookworm_arm64.deb`
- `ros-noetic-roscpp-core_0.7.3-0focal_arm64.deb`
- `ros-noetic-roscpp-dbgsym_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-roscpp-dbgsym_1.17.4-0focal_arm64.deb`
- `ros-noetic-roscpp-serialization-dbgsym_0.7.3-0bookworm_arm64.deb`
- `ros-noetic-roscpp-serialization-dbgsym_0.7.3-0focal_arm64.deb`
- `ros-noetic-roscpp-serialization_0.7.3-0bookworm_arm64.deb`
- `ros-noetic-roscpp-serialization_0.7.3-0focal_arm64.deb`
- `ros-noetic-roscpp-traits_0.7.3-0bookworm_arm64.deb`
- `ros-noetic-roscpp-traits_0.7.3-0focal_arm64.deb`
- `ros-noetic-roscpp_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-roscpp_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosgraph-msgs_1.11.4-0bookworm_arm64.deb`
- `ros-noetic-rosgraph-msgs_1.11.4-0focal_arm64.deb`
- `ros-noetic-rosgraph_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosgraph_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosmaster_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosmaster_1.17.4-0focal_arm64.deb`
- `ros-noetic-rospy_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rospy_1.17.4-0focal_arm64.deb`

### Система сборки
- `ros-noetic-catkin_0.8.12-0bookworm_arm64.deb`
- `ros-noetic-catkin_0.8.12-0focal_arm64.deb`
- `ros-noetic-cmake-modules_0.5.2-0bookworm_arm64.deb`
- `ros-noetic-cmake-modules_0.5.2-0focal_arm64.deb`
- `ros-noetic-rosbuild_1.15.10-0bookworm_arm64.deb`
- `ros-noetic-rosbuild_1.15.10-0focal_arm64.deb`
- `ros-noetic-rospack-dbgsym_2.6.4-0bookworm_arm64.deb`
- `ros-noetic-rospack-dbgsym_2.6.4-0focal_arm64.deb`
- `ros-noetic-rospack_2.6.4-0bookworm_arm64.deb`
- `ros-noetic-rospack_2.6.4-0focal_arm64.deb`

### Типы сообщений
- `ros-noetic-actionlib-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-actionlib-msgs_1.13.2-0focal_arm64.deb`
- `ros-noetic-common-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-common-msgs_1.13.2-0focal_arm64.deb`
- `ros-noetic-control-msgs_1.5.2-0bookworm_arm64.deb`
- `ros-noetic-control-msgs_1.5.2-0focal_arm64.deb`
- `ros-noetic-diagnostic-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-diagnostic-msgs_1.13.2-0focal_arm64.deb`
- `ros-noetic-geographic-msgs_0.5.6-0bookworm_arm64.deb`
- `ros-noetic-geographic-msgs_0.5.6-0focal_arm64.deb`
- `ros-noetic-geometry-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-geometry-msgs_1.13.2-0focal_arm64.deb`
- `ros-noetic-nav-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-nav-msgs_1.13.2-0focal_arm64.deb`
- `ros-noetic-sensor-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-sensor-msgs_1.13.2-0focal_arm64.deb`
- `ros-noetic-shape-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-shape-msgs_1.13.2-0focal_arm64.deb`
- `ros-noetic-std-msgs_0.5.14-0bookworm_arm64.deb`
- `ros-noetic-std-msgs_0.5.14-0focal_arm64.deb`
- `ros-noetic-stereo-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-stereo-msgs_1.13.2-0focal_arm64.deb`
- `ros-noetic-tf2-geometry-msgs_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2-geometry-msgs_0.7.10-0focal_arm64.deb`
- `ros-noetic-tf2-msgs_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2-msgs_0.7.10-0focal_arm64.deb`
- `ros-noetic-tf2-sensor-msgs_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2-sensor-msgs_0.7.10-0focal_arm64.deb`
- `ros-noetic-trajectory-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-trajectory-msgs_1.13.2-0focal_arm64.deb`
- `ros-noetic-uuid-msgs_1.0.6-0bookworm_arm64.deb`
- `ros-noetic-uuid-msgs_1.0.6-0focal_arm64.deb`
- `ros-noetic-visualization-msgs_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-visualization-msgs_1.13.2-0focal_arm64.deb`

### Библиотека трансформаций
- `ros-noetic-roswtf_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-roswtf_1.17.4-0focal_arm64.deb`
- `ros-noetic-test-tf2_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-test-tf2_0.7.10-0focal_arm64.deb`
- `ros-noetic-tf-conversions_1.13.4-0bookworm_arm64.deb`
- `ros-noetic-tf-conversions_1.13.4-0focal_arm64.deb`
- `ros-noetic-tf2-bullet_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2-bullet_0.7.10-0focal_arm64.deb`
- `ros-noetic-tf2-eigen_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2-eigen_0.7.10-0focal_arm64.deb`
- `ros-noetic-tf2-kdl_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2-kdl_0.7.10-0focal_arm64.deb`
- `ros-noetic-tf2-py_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2-py_0.7.10-0focal_arm64.deb`
- `ros-noetic-tf2-tools_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2-tools_0.7.10-0focal_arm64.deb`
- `ros-noetic-tf2_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-tf2_0.7.10-0focal_arm64.deb`
- `ros-noetic-tf_1.13.4-0bookworm_arm64.deb`
- `ros-noetic-tf_1.13.4-0focal_arm64.deb`

### Обработка изображений
- `ros-noetic-camera-calibration-parsers-dbgsym_1.12.1-0bookworm_arm64.deb`
- `ros-noetic-camera-calibration-parsers-dbgsym_1.12.1-0focal_arm64.deb`
- `ros-noetic-camera-calibration-parsers_1.12.1-0bookworm_arm64.deb`
- `ros-noetic-camera-calibration-parsers_1.12.1-0focal_arm64.deb`
- `ros-noetic-camera-info-manager-dbgsym_1.12.1-0bookworm_arm64.deb`
- `ros-noetic-camera-info-manager-dbgsym_1.12.1-0focal_arm64.deb`
- `ros-noetic-camera-info-manager_1.12.1-0bookworm_arm64.deb`
- `ros-noetic-camera-info-manager_1.12.1-0focal_arm64.deb`
- `ros-noetic-image-common_1.12.1-0bookworm_arm64.deb`
- `ros-noetic-image-common_1.12.1-0focal_arm64.deb`
- `ros-noetic-image-geometry_1.16.2-0bookworm_arm64.deb`
- `ros-noetic-image-geometry_1.16.2-0focal_arm64.deb`
- `ros-noetic-image-transport-dbgsym_1.12.1-0bookworm_arm64.deb`
- `ros-noetic-image-transport-dbgsym_1.12.1-0focal_arm64.deb`
- `ros-noetic-image-transport_1.12.1-0bookworm_arm64.deb`
- `ros-noetic-image-transport_1.12.1-0focal_arm64.deb`
- `ros-noetic-opencv-tests_1.16.2-0bookworm_arm64.deb`
- `ros-noetic-opencv-tests_1.16.2-0focal_arm64.deb`
- `ros-noetic-polled-camera_1.12.1-0bookworm_arm64.deb`
- `ros-noetic-polled-camera_1.12.1-0focal_arm64.deb`
- `ros-noetic-vision-opencv_1.16.2-0bookworm_arm64.deb`
- `ros-noetic-vision-opencv_1.16.2-0focal_arm64.deb`

### Утилиты
- `ros-noetic-rosbag-dbgsym_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosbag-dbgsym_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosbag-migration-rule_1.0.2-0bookworm_arm64.deb`
- `ros-noetic-rosbag-migration-rule_1.0.2-0focal_arm64.deb`
- `ros-noetic-rosbag-storage-dbgsym_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosbag-storage-dbgsym_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosbag-storage_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosbag-storage_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosbag_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosbag_1.17.4-0focal_arm64.deb`
- `ros-noetic-roslaunch_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-roslaunch_1.17.4-0focal_arm64.deb`

### Отладочные символы
- `ros-noetic-actionlib-dbgsym_1.14.3-0bookworm_arm64.deb`
- `ros-noetic-actionlib-dbgsym_1.14.3-0focal_arm64.deb`
- `ros-noetic-bondcpp-dbgsym_1.8.7-0bookworm_arm64.deb`
- `ros-noetic-bondcpp-dbgsym_1.8.7-0focal_arm64.deb`
- `ros-noetic-class-loader-dbgsym_0.5.2-0bookworm_arm64.deb`
- `ros-noetic-class-loader-dbgsym_0.5.2-0focal_arm64.deb`
- `ros-noetic-control-toolbox-dbgsym_1.19.0-0bookworm_arm64.deb`
- `ros-noetic-control-toolbox-dbgsym_1.19.0-0focal_arm64.deb`
- `ros-noetic-cpp-common-dbgsym_0.7.3-0bookworm_arm64.deb`
- `ros-noetic-cpp-common-dbgsym_0.7.3-0focal_arm64.deb`
- `ros-noetic-dynamic-reconfigure-dbgsym_1.7.6-0bookworm_arm64.deb`
- `ros-noetic-dynamic-reconfigure-dbgsym_1.7.6-0focal_arm64.deb`
- `ros-noetic-eigen-conversions-dbgsym_1.13.4-0bookworm_arm64.deb`
- `ros-noetic-eigen-conversions-dbgsym_1.13.4-0focal_arm64.deb`
- `ros-noetic-geodesy-dbgsym_0.5.6-0bookworm_arm64.deb`
- `ros-noetic-geodesy-dbgsym_0.5.6-0focal_arm64.deb`
- `ros-noetic-kdl-conversions-dbgsym_1.13.4-0bookworm_arm64.deb`
- `ros-noetic-kdl-conversions-dbgsym_1.13.4-0focal_arm64.deb`
- `ros-noetic-message-filters-dbgsym_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-message-filters-dbgsym_1.17.4-0focal_arm64.deb`
- `ros-noetic-nodelet-dbgsym_1.11.2-0bookworm_arm64.deb`
- `ros-noetic-nodelet-dbgsym_1.11.2-0focal_arm64.deb`
- `ros-noetic-realtime-tools-dbgsym_1.16.1-0bookworm_arm64.deb`
- `ros-noetic-realtime-tools-dbgsym_1.16.1-0focal_arm64.deb`
- `ros-noetic-rosconsole-bridge-dbgsym_0.5.5-0bookworm_arm64.deb`
- `ros-noetic-rosconsole-bridge-dbgsym_0.5.5-0focal_arm64.deb`
- `ros-noetic-rosconsole-dbgsym_1.14.4-0bookworm_arm64.deb`
- `ros-noetic-rosconsole-dbgsym_1.14.4-0focal_arm64.deb`
- `ros-noetic-roslib-dbgsym_1.15.10-0bookworm_arm64.deb`
- `ros-noetic-roslib-dbgsym_1.15.10-0focal_arm64.deb`
- `ros-noetic-roslz4-dbgsym_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-roslz4-dbgsym_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosout-dbgsym_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosout-dbgsym_1.17.4-0focal_arm64.deb`
- `ros-noetic-rostime-dbgsym_0.7.3-0bookworm_arm64.deb`
- `ros-noetic-rostime-dbgsym_0.7.3-0focal_arm64.deb`
- `ros-noetic-tf-conversions-dbgsym_1.13.4-0bookworm_arm64.deb`
- `ros-noetic-tf-conversions-dbgsym_1.13.4-0focal_arm64.deb`
- `ros-noetic-tf-dbgsym_1.13.4-0bookworm_arm64.deb`
- `ros-noetic-tf-dbgsym_1.13.4-0focal_arm64.deb`
- `ros-noetic-topic-tools-dbgsym_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-topic-tools-dbgsym_1.17.4-0focal_arm64.deb`
- `ros-noetic-xmlrpcpp-dbgsym_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-xmlrpcpp-dbgsym_1.17.4-0focal_arm64.deb`

### Прочие пакеты
- `hddtemp_0.3-beta15-54_arm64.deb`
- `libboost-filesystem1.71.0_1.71.0-6ubuntu6_arm64.deb`
- `libboost-system1.71.0_1.71.0-6ubuntu6_arm64.deb`
- `libboost-thread1.71.0_1.71.0-6ubuntu6_arm64.deb`
- `ros-noetic-actionlib_1.14.3-0bookworm_arm64.deb`
- `ros-noetic-actionlib_1.14.3-0focal_arm64.deb`
- `ros-noetic-bond-core_1.8.7-0bookworm_arm64.deb`
- `ros-noetic-bond-core_1.8.7-0focal_arm64.deb`
- `ros-noetic-bond_1.8.7-0bookworm_arm64.deb`
- `ros-noetic-bond_1.8.7-0focal_arm64.deb`
- `ros-noetic-bondcpp_1.8.7-0bookworm_arm64.deb`
- `ros-noetic-bondcpp_1.8.7-0focal_arm64.deb`
- `ros-noetic-bondpy_1.8.7-0bookworm_arm64.deb`
- `ros-noetic-bondpy_1.8.7-0focal_arm64.deb`
- `ros-noetic-class-loader_0.5.2-0bookworm_arm64.deb`
- `ros-noetic-class-loader_0.5.2-0focal_arm64.deb`
- `ros-noetic-control-toolbox_1.19.0-0bookworm_arm64.deb`
- `ros-noetic-control-toolbox_1.19.0-0focal_arm64.deb`
- `ros-noetic-cpp-common_0.7.3-0bookworm_arm64.deb`
- `ros-noetic-cpp-common_0.7.3-0focal_arm64.deb`
- `ros-noetic-cv-bridge_1.16.2-0bookworm_arm64.deb`
- `ros-noetic-cv-bridge_1.16.2-0focal_arm64.deb`
- `ros-noetic-dynamic-reconfigure_1.7.6-0bookworm_arm64.deb`
- `ros-noetic-dynamic-reconfigure_1.7.6-0focal_arm64.deb`
- `ros-noetic-eigen-conversions_1.13.4-0bookworm_arm64.deb`
- `ros-noetic-eigen-conversions_1.13.4-0focal_arm64.deb`
- `ros-noetic-eigen-stl-containers_0.1.8-0bookworm_arm64.deb`
- `ros-noetic-eigen-stl-containers_0.1.8-0focal_arm64.deb`
- `ros-noetic-gencpp_0.7.2-0bookworm_arm64.deb`
- `ros-noetic-gencpp_0.7.2-0focal_arm64.deb`
- `ros-noetic-geneus_3.0.0-0bookworm_arm64.deb`
- `ros-noetic-geneus_3.0.0-0focal_arm64.deb`
- `ros-noetic-genlisp_0.4.18-0bookworm_arm64.deb`
- `ros-noetic-genlisp_0.4.18-0focal_arm64.deb`
- `ros-noetic-genmsg_0.6.1-0bookworm_arm64.deb`
- `ros-noetic-genmsg_0.6.1-0focal_arm64.deb`
- `ros-noetic-gennodejs_2.0.2-0bookworm_arm64.deb`
- `ros-noetic-gennodejs_2.0.2-0focal_arm64.deb`
- `ros-noetic-genpy_0.6.18-0bookworm_arm64.deb`
- `ros-noetic-genpy_0.6.18-0focal_arm64.deb`
- `ros-noetic-geodesy_0.5.6-0bookworm_arm64.deb`
- `ros-noetic-geodesy_0.5.6-0focal_arm64.deb`
- `ros-noetic-geographic-info_0.5.6-0bookworm_arm64.deb`
- `ros-noetic-geographic-info_0.5.6-0focal_arm64.deb`
- `ros-noetic-geometry2_0.7.10-0bookworm_arm64.deb`
- `ros-noetic-geometry2_0.7.10-0focal_arm64.deb`
- `ros-noetic-geometry_1.13.4-0bookworm_arm64.deb`
- `ros-noetic-geometry_1.13.4-0focal_arm64.deb`
- `ros-noetic-kdl-conversions_1.13.4-0bookworm_arm64.deb`
- `ros-noetic-kdl-conversions_1.13.4-0focal_arm64.deb`
- `ros-noetic-mavlink_2021.3.3-0bookworm_arm64.deb`
- `ros-noetic-mavlink_2021.3.3-0focal_arm64.deb`
- `ros-noetic-message-filters_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-message-filters_1.17.4-0focal_arm64.deb`
- `ros-noetic-message-generation_0.4.1-0bookworm_arm64.deb`
- `ros-noetic-message-generation_0.4.1-0focal_arm64.deb`
- `ros-noetic-message-runtime_0.4.13-0bookworm_arm64.deb`
- `ros-noetic-message-runtime_0.4.13-0focal_arm64.deb`
- `ros-noetic-mk_1.15.8-1buster.20220926.180800_arm64.deb`
- `ros-noetic-nodelet-core_1.11.2-0bookworm_arm64.deb`
- `ros-noetic-nodelet-core_1.11.2-0focal_arm64.deb`
- `ros-noetic-nodelet-topic-tools_1.11.2-0bookworm_arm64.deb`
- `ros-noetic-nodelet-topic-tools_1.11.2-0focal_arm64.deb`
- `ros-noetic-nodelet_1.11.2-0bookworm_arm64.deb`
- `ros-noetic-nodelet_1.11.2-0focal_arm64.deb`
- `ros-noetic-pluginlib_1.13.2-0bookworm_arm64.deb`
- `ros-noetic-pluginlib_1.13.2-0focal_arm64.deb`
- `ros-noetic-realtime-tools_1.16.1-0bookworm_arm64.deb`
- `ros-noetic-realtime-tools_1.16.1-0focal_arm64.deb`
- `ros-noetic-ros-environment_1.3.2-0bookworm_arm64.deb`
- `ros-noetic-ros-environment_1.3.2-0focal_arm64.deb`
- `ros-noetic-rosbash_1.15.8-1buster.20210726.194131_arm64.deb`
- `ros-noetic-rosboost-cfg_1.15.8-1buster.20210726.194130_arm64.deb`
- `ros-noetic-rosclean_1.15.10-0bookworm_arm64.deb`
- `ros-noetic-rosclean_1.15.10-0focal_arm64.deb`
- `ros-noetic-rosconsole-bridge_0.5.5-0bookworm_arm64.deb`
- `ros-noetic-rosconsole-bridge_0.5.5-0focal_arm64.deb`
- `ros-noetic-rosconsole_1.14.4-0bookworm_arm64.deb`
- `ros-noetic-rosconsole_1.14.4-0focal_arm64.deb`
- `ros-noetic-roscreate_1.15.8-1buster.20210726.215204_arm64.deb`
- `ros-noetic-roslang_1.15.10-0bookworm_arm64.deb`
- `ros-noetic-roslang_1.15.10-0focal_arm64.deb`
- `ros-noetic-roslib_1.15.10-0bookworm_arm64.deb`
- `ros-noetic-roslib_1.15.10-0focal_arm64.deb`
- `ros-noetic-roslisp_1.9.25-0bookworm_arm64.deb`
- `ros-noetic-roslisp_1.9.25-0focal_arm64.deb`
- `ros-noetic-roslz4_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-roslz4_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosmake_1.15.8-1buster.20210726.194259_arm64.deb`
- `ros-noetic-rosmsg_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosmsg_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosnode_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosnode_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosout_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosout_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosparam_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosparam_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosservice_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rosservice_1.17.4-0focal_arm64.deb`
- `ros-noetic-rostest_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rostest_1.17.4-0focal_arm64.deb`
- `ros-noetic-rostime_0.7.3-0bookworm_arm64.deb`
- `ros-noetic-rostime_0.7.3-0focal_arm64.deb`
- `ros-noetic-rostopic_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-rostopic_1.17.4-0focal_arm64.deb`
- `ros-noetic-rosunit_1.15.10-0bookworm_arm64.deb`
- `ros-noetic-rosunit_1.15.10-0focal_arm64.deb`
- `ros-noetic-smclib_1.8.7-0bookworm_arm64.deb`
- `ros-noetic-smclib_1.8.7-0focal_arm64.deb`
- `ros-noetic-std-srvs_1.11.4-0bookworm_arm64.deb`
- `ros-noetic-std-srvs_1.11.4-0focal_arm64.deb`
- `ros-noetic-topic-tools_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-topic-tools_1.17.4-0focal_arm64.deb`
- `ros-noetic-unique-id_1.0.6-0bookworm_arm64.deb`
- `ros-noetic-unique-id_1.0.6-0focal_arm64.deb`
- `ros-noetic-unique-identifier_1.0.6-0bookworm_arm64.deb`
- `ros-noetic-unique-identifier_1.0.6-0focal_arm64.deb`
- `ros-noetic-xmlrpcpp_1.17.4-0bookworm_arm64.deb`
- `ros-noetic-xmlrpcpp_1.17.4-0focal_arm64.deb`

## 🔧 Зависимости

Пакеты требуют следующих системных зависимостей:
- `libboost-filesystem1.71.0`
- `libboost-system1.71.0` 
- `libboost-thread1.71.0`
- `python3-catkin-pkg-modules`
- `python3-rosdep-modules`
- `hddtemp` (для мониторинга оборудования)

## 🎯 Целевое оборудование

- **Плата**: Orange Pi 3B
- **Процессор**: ARM Cortex-A53 quad-core
- **Архитектура**: ARM64 (aarch64)
- **ОС**: Debian Bookworm (12)

## 🔄 Управление пакетами

### 📝 Именование пакетов
- Пакеты автоматически переименованы с `-0focal` на `-0bookworm`
- **GitHub Actions** автоматически обрабатывает процесс переименования
- Все пакеты оптимизированы для Debian Bookworm (12)

### 🤖 Автоматическое переименование
- **GitHub Action** автоматически переименовывает пакеты при push
- **Ручное переименование** доступно через скрипты при необходимости
- **Резервная копия** оригинальных файлов создается автоматически

## 📝 Примечания

- Все пакеты скомпилированы для архитектуры ARM64
- Оптимизированы для Debian Bookworm (12)
- Включают как релизные, так и отладочные пакеты
- Некоторые пакеты могут требовать дополнительные системные зависимости
- Пакеты автоматически переименованы для совместимости с Debian Bookworm

## 🤖 Автоматизация

Этот репозиторий настроен с автоматическим обновлением README:

### GitHub Actions
- **Автоматическое обновление** при добавлении новых .deb файлов
- **Автоматическое переименование** пакетов для Debian Bookworm
- **Ежедневная проверка** пакетов (6:00 UTC)
- **Детальная аналитика** пакетов и репозитория
- **✅ Обновлено до актуальных версий** (actions v4/v5)

### Локальные скрипты
```bash
# Обновить README локально
./update_readme.sh

# Или через Python
python3 generate_readme.py

# Переименовать пакеты для Debian Bookworm
./rename_packages.sh
# или
python3 rename_packages.py
```

### Настройка
- [GITHUB_ACTIONS_SETUP.md](GITHUB_ACTIONS_SETUP.md) - инструкции по настройке
- [MIGRATION_NOTES.md](MIGRATION_NOTES.md) - информация об обновлениях
- [GITHUB_PERMISSIONS_FIX.md](GITHUB_PERMISSIONS_FIX.md) - исправление проблем с правами

### Альтернативные Workflow
- **Auto-commit**: Обновляет README напрямую (требует правильных прав)
- **Pull Request**: Создает PR с изменениями (безопаснее, без проблем с правами)

## 🤝 Вклад в проект

Этот репозиторий содержит предварительно скомпилированные пакеты. Для модификации исходного кода обратитесь к официальным исходным репозиториям ROS Noetic.

## 📄 Лицензия

Эти пакеты следуют тем же условиям лицензирования, что и оригинальная дистрибуция ROS Noetic. Обратитесь к лицензиям отдельных пакетов для получения конкретных условий.

---

**Автоматически сгенерировано**: 2025-09-17  
**Версия ROS**: Noetic Ninjemys  
**Количество пакетов**: 291 .deb файлов  
**Скрипт генерации**: generate_readme.py  
**Целевая ОС**: Debian Bookworm (12)  
**Auto-updated**: ✅ GitHub Actions v4/v5 enabled
