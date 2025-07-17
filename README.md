# Gestor de Tareas - Aplicación CRUD con Flutter

Esta es una sencilla aplicación de gestión de tareas (CRUD) desarrollada con Flutter. Permite a los usuarios crear, leer, actualizar y eliminar tareas, las cuales se almacenan de forma persistente en una base de datos local SQLite.

## ✨ Características

- **Crear Tareas:** Añade nuevas tareas con un título y una descripción.
- **Leer Tareas:** Visualiza una lista de todas las tareas guardadas.
- **Actualizar Tareas:** Edita el título y la descripción de las tareas existentes.
- **Eliminar Tareas:** Borra tareas de la lista.
- **Persistencia de Datos:** La información se guarda localmente en el dispositivo utilizando el paquete `sqflite`.

## 📸 Capturas de Pantalla

<img width="456" height="752" alt="crud_1" src="https://github.com/user-attachments/assets/4d11b4ac-a6af-43a3-95bb-63c9a1928f15" />

<img width="451" height="752" alt="crud_2" src="https://github.com/user-attachments/assets/cee30fc5-6621-4769-b59e-8b9b1ec7beff" />


<img width="452" height="749" alt="crud_3" src="https://github.com/user-attachments/assets/aac2f59c-76d7-44e3-b66b-1be74acf8c38" />

<img width="455" height="746" alt="crud_4" src="https://github.com/user-attachments/assets/811b8e2a-61b4-49ba-a861-ff69430e402e" />


## 🚀 Empezando

Sigue estas instrucciones para tener una copia del proyecto funcionando en tu máquina local para desarrollo y pruebas.

### Pre-requisitos

Asegúrate de tener el [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado en tu sistema.

### Instalación

1.  **Clona el repositorio:**
    ```sh
    git clone <URL-DEL-REPOSITORIO>
    ```
2.  **Navega al directorio del proyecto:**
    ```sh
    cd crud_app
    ```
3.  **Instala las dependencias:**
    ```sh
    flutter pub get
    ```
4.  **Ejecuta la aplicación:**
    Conecta un dispositivo o inicia un emulador y ejecuta el siguiente comando:
    ```sh
    flutter run
    ```

## 🛠️ Tecnologías Utilizadas

- **[Flutter](https://flutter.dev/)**: El framework de UI de Google para crear aplicaciones nativas para móvil, web y escritorio desde una única base de código.
- **[Dart](https://dart.dev/)**: El lenguaje de programación utilizado por Flutter.
- **[sqflite](https://pub.dev/packages/sqflite)**: Plugin de Flutter para bases de datos SQLite.

## 📂 Estructura del Proyecto

```
lib/
├── main.dart               # Punto de entrada de la aplicación.
├── HomeScree.dart          # Widget principal de la UI, muestra la lista de tareas.
└── helpers/
    └── db_helpers.dart     # Lógica para interactuar con la base de datos SQLite.
```
