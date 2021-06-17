# ioniconf_2021_flutter

Recommend using [FVM](https://fvm.app/) to manage your flutter version.

```
fvm use 2.2.1
```

We're using html as a web-renderer instead of canvas kit.

```
fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs # this will generate the code once
fvm flutter run -d chrome --web-renderer html
```