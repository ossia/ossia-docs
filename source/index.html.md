---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - c: C
  - cpp--98: Safe C++
  - cpp--14: Fast C++
  - python: Python
  - qml: QML
  - cpp--ofx: OFX
  - csharp: Unity3D
  - plaintext--pd: Pd
  - plaintext--max: Max
  - smalltalk: SuperCollider

toc_footers:
  - <a href='https://github.com/OSSIA/libossia'>Get libossia on Github</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>


search: true
---

# Introduction

**libossia** is a modern C++, cross-environment distributed object model for creative coding and interaction scoring.
It allows to expose the parameters of your creative coding application over the network, and score them in time.

It handles various protocols such as OSC, MIDI, Minuit and OSCQuery.
It offers bindings for many environments (PureData, Max/MSP, Python, Unity3D, QML, Faust, SuperCollider).

Here's a quick explanation of the bindings:

* **C** : a C89 binding that should work everywhere and has a stable and strong API & ABI guarantee.
* **Safe C++**: a simplified C++ binding, kept compatible with C++98, which makes it hard to have problems at the cost of performance.
* **Fast C++**: the native libossia API, written in modern C++14. Subject to frequent updates and changes; use to get maximal performance.
* **Python**: Python 2 / 3 bindings made with [pybind11](https://github.com/pybind/pybind11).
* **QML**: Bindings for the Qt declarative UI language, [QML](http://doc.qt.io/qt-5/qmlapplications.html). Very nice for user interfaces.
* **OFX**: OpenFrameworks bindings. Requires the [ofxOssia](https://github.com/OSSIA/ofxOSSIA) addon.
* **Unity3D**: Bindings for the Unity3D game engine. Required C# files are [here](https://github.com/jcelerier/ossia-unity3d/tree/master/ossia).
* **Pd**: PureData bindings. Requires at least Pd vanilla 0.48/
* **Max**: Max/MSP bindings. Requires at least Max 7.
* **SuperCollider**: Requires a custom build of SuperCollider.
* **Faust**: A Faust architecture file is provided. It should be modified however to tailor your own system.

# Setup

## Compilation

```c
// device.c:
#include <ossia-c/ossia-c.h>
int main(int argc, char** argv) { }

// Assuming the release package is extracted here:

// Linux:
gcc -std=c89 device.c -Iossia/include -Lossia/lib -lossia

// Mac:
clang -std=c89 device.c -Iossia/include -Lossia/lib -lossia

// Windows with MSVC: run in a Visual Studio shell:
cl.exe -std=c89 device.c -Iossia/include ossia/lib/ossia.lib
```

```cpp--98
// device.cpp:
#include <ossia-cpp/ossia-cpp98.hpp>
int main(int argc, char** argv) { }

// Assuming the release package is extracted here:

// Linux:
g++ -std=c++98 device.c -Iossia/include -Lossia/lib -lossia

// Mac:
clang++ -std=c++98 device.c -Iossia/include -Lossia/lib -lossia

// Windows with MSVC: run in a Visual Studio shell:
cl.exe device.c -Iossia/include ossia/lib/ossia.lib
```

```cpp--14
// device.cpp:
#include <ossia/ossia.hpp>
int main(int argc, char** argv) { }

// Assuming the release package is extracted here:

// Linux:
g++ -std=c++1z device.c -Iossia/include -Lossia/lib -lossia

// Mac:
clang++ -std=c++1z device.c -Iossia/include -Lossia/lib -lossia

// Windows with MSVC: run in a Visual Studio shell:
cl.exe device.c -Iossia/include ossia/lib/ossia.lib
```

```python
# device.py:
import ossia_python as ossia

# Run with ossia_python.{so,dll,dylib} in the current folder
python device.py
```

```qml
// Device.qml
import Ossia 1.0 as Ossia

Item {}

// Extract the Ossia folder in the Qt/qml folder, e.g.
// /home/myself/Qt/5.9.1/gcc_64/qml
// /Users/myself/Qt/5.9.1/clang_64/qml
// c:\Qt\5.9.1\msvc2017_64\qml
// etc...
// and run :
qmlscene Device.qml
```

```cpp--ofx
// Like every other ofx addon: clone the repository
// https://github.com/OSSIA/ofxOssia in the ofx addons folder
```

```csharp
// Create a new empty GameObject and add the script OssiaDevice.cs to it.
```

```plaintext--pd
// Install with Deken or extract in ~/pd-externals
```

```plaintext--max
// Extract the ossia package to Documents/Max 7/Packages.
```

```smalltalk
```

# Basic networking

## Local OSCQuery device

```c
#include <ossia-c/ossia-c.h>
...
ossia_protocol_t proto = ossia_protocol_oscquery_server_create(1234, 5678);
ossia_device_t dev = ossia_device_create(proto, "supersoftware");
...
ossia_device_free(dev);
ossia_protocol_free(proto);
```

```cpp--98
#include <ossia-cpp/ossia-cpp98.hpp>
...
opp::oscquery_server dev("supersoftware");
```

```cpp--14
#include <ossia/ossia.hpp>
...
ossia::net::generic_device dev{
    std::make_unique<ossia::oscquery::oscquery_server_protocol>(1234, 5678),
    "supersoftware"};
```

```python
import ossia_python as ossia
local_device = ossia.LocalDevice("supersoftware")
```

```qml
import Ossia 1.0 as Ossia
...
Ossia.OSCQueryServer {
    name: "supersoftware"
}
```

```cpp--ofx
```

```csharp
using Ossia;
...
var proto = new Ossia.OSCQuery(1234, 5678);
var dev = new Ossia.Device(proto, "supersoftware");
```

```plaintext--pd
```

<pre class="highlight plaintext tab-plaintext--max"><img src="/images/ossia.device.png" /></pre>


```smalltalk
```

A device represents a tree of parameters.

Local devices map to real parameters on the executable libossia is used with.
For instance the frequency of a filter, etc.

Remote devices are **mirror images** of local devices on other applications:
remote controls, mobile apps, etc.
Every parameter in a local device will be synchronized with the remote
devices that connected to it.

Devices can be mapped to different protocols: **Minuit**, **OSCQuery**, etc.
For the sake of simplicity, some bindings tie together device and protocol
implementation.

We use OSCQuery as an example of protocol here.
Once a device has been created, it is possible to check what's in it by going
to [http://localhost:5678](http://localhost:5678).

For more information on the OSCQuery protocol, please refer to [the proposal](https://github.com/mrRay/OSCQueryProposal).

## Creating nodes
```c
ossia_protocol_t proto = ossia_protocol_oscquery_server_create(1234, 5678);
ossia_device_t dev = ossia_device_create(proto, "supersoftware");
ossia_node_t root = ossia_device_get_root_node(dev);

ossia_node_t a_node = ossia_node_create(root, "/foo/blu");
```

```cpp--98
opp::oscquery_server dev("supersoftware");
opp::node n = dev.get_root_node().create_node("/foo/blu"));
```

```cpp--14
ossia::net::generic_device dev{
    std::make_unique<ossia::oscquery::oscquery_server_protocol>(1234, 5678),
    "supersoftware"};
auto& n1 = ossia::net::create_node(dev, "/foo/bar");
```

```python
```

```qml
import QtQuick 2.7
import QtQuick.Controls 2.0
import Ossia 1.0 as Ossia
...
ApplicationWindow {
    visible: true
    id: root
    Ossia.OSCQueryServer {
        id: device
        name: "supersoftware"
    }

    Ossia.Node { node: "/foo/bar" }
    Item {
        // Will give /foo/bar/hello
        Ossia.Node { node: "hello" }
    }

    Component.onCompleted: device.recreate(root)
}
```

```cpp--ofx
```

```csharp
dev.GetRootNode().AddChild ("scene");
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

> When multiple nodes with the same name are created, they will take instance numbers:

```c
ossia_node_t root = ...;
ossia_node_create(root, "/foo/blu"); // /foo/blu
ossia_node_create(root, "/foo/blu"); // /foo/blu.1
ossia_node_create(root, "/foo/blu"); // /foo/blu.2
```

```cpp--98
opp::oscquery_server dev = ...;

// /foo/blu
dev.get_root_node().create_node("/foo/blu"));
// /foo/blu.1
dev.get_root_node().create_node("/foo/blu"));
// /foo/blu.2
dev.get_root_node().create_node("/foo/blu"));
```

```cpp--14
ossia::net::generic_device dev = ...;

// /foo/bar
ossia::net::create_node(dev, "/foo/bar");
// /foo/bar.1
ossia::net::create_node(dev, "/foo/bar");
// /foo/bar.2
ossia::net::create_node(dev, "/foo/bar");
```

```python
```

```qml
// Creates /foo/bar, /foo/bar.1, /foo/bar.2
Repeater {
    model: 3
    Ossia.Node { node: "/foo/bar" }
}
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

The nodes in the device are simply called "nodes" in the API.
Nodes are identified with the OSC parameter syntax: `/foo/bar`.

**Nodes** per se don't carry any value; they have to be extended with **parameters**
to be able to send and receive messages.

## Creating parameters

> First we create a parameter

```c
ossia_node_t a_node = ...;

ossia_parameter_t a_parameter = ossia_node_create_parameter(a_node, FLOAT_T);
```

```cpp--98
opp::node root = ...;
opp::node n = root.create_float("/foo/bar");
```

```cpp--14
ossia::net::node_base& n = ...;
auto param = n.create_parameter(val_type::FLOAT);
```

```python
```

```qml
// A parameter is node + parameter.
Ossia.Parameter {
  id: param
  node: "/tata"
  valueType: Ossia.Type.Float
}

// Used for valueless parameters
Ossia.Signal {
  id: sig
  node: "/toto"
}
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

> Then we can send values to this parameter

```c
ossia_parameter_push_f(a_parameter, 345.);
```

```cpp--98
n.set_value(2.34);
```

```cpp--14
param->push_value(3.56);
```

```python
```

```qml
onSomething: {
  param.value = 123;
  sig.trigger();
}
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

> And read them

```c
/* Get the current value */
ossia_value_t val = ossia_parameter_clone_value(a_parameter);

/* Request the value to the server if any */
ossia_value_t val = ossia_parameter_fetch_value(a_parameter);
```

```cpp--98
/* Get the current value */
opp::value v = n.get_value();

/* Request the value to the server if any */
opp::value v = n.fetch_value();
```

```cpp--14
// Get the current value
param->value();

// Request the value to the server if any and wait until it is received to return it.
param->fetch_value();

// Just request the value.
param->request_value();

// Request the value and get a std::future that can be used later.
auto fut = param->pull_value_async();
```

```python
```

```qml
console.log(param.value)
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Each node can only have a single parameter.
parameteres can have the following types:

* Integer: 32-bit int.
* Floating-point: 32-bit float.
* Boolean: true/false.
* Impulse: no value; just a message.
* ASCII Character: 'a', '0', '$'...
* String
* Tuple: a generic list of values: `[3, 'a', 2.68, ["foo", "bar"]]`

As an optimisation, specific types for 2, 3, and 4 floats are provided;
they are referred to as Vec2f, Vec3f, Vec4f through the code.

Values can be written to a parameter, and fetched from it.

This example shows how to create a node, a parameter, and send a value to
the parameter.

## parameter callbacks
```c
void my_callback(void* n, ossia_value_t v)
{
  /* 0 if it's not a float */
  float f = ossia_value_to_float(v);

  /* safe */
  float g = ossia_value_convert_float(v);

  /* ownership of the value is transfered to the callback */
  ossia_value_free(v);
}
...

ossia_parameter_t a_parameter = ...;
ossia_parameter_push_callback(a_parameter, my_callback, NULL);
```

```cpp--98
void my_callback(void* ctx, const opp::value& v)
{
  float f = v.to_float();
}
...

opp::node n = ...;
n.set_value_callback(my_callback, 0);
```

```cpp--14
ossia::net::node_base& n = ...;
auto param = n.create_parameter(val_type::FLOAT);
param->add_callback([] (const ossia::value& v) {
  // if you are sure of the type, this is fast:
  float f = v.get<float>();

  // if you are not, this is safe:
  float maybe_f = ossia::convert<float>(v);
});
```

```python
```

```qml
Ossia.Parameter {
  onValueChanged: console.log(value)
}

Ossia.Signal {
  onTriggered: console.log("hi");
}
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

parameter callbacks will inform you every time a parameter receives a message.
On environments that support this, this will enable listening on the remote end.
That is, if a remote device has no callbacks, network messages won't be sent upon
modification.

## Property binding

```qml
Rectangle {
  // Creates /rect
  Ossia.Node
  { node: "rect" }

  // Creates /rect/width of type float
  Ossia.Property on width
  { }

  // Creates /some/node of type float
  Ossia.Property on height
  { node: "/some/node" }
}
```

```csharp
// Add the Ossia.Object script to your GameObject.
// It will create a new node with the name of your object.
// Child objects with the script will be placed as childs in the
// node hierarchy.

// Afterwards, other behaviours can expose properties like this:
public class Banana : MonoBehaviour {
    // Creates /Frequency
	[Ossia.Expose]
	public int Frequency;

    // Creates /Foo
	[Ossia.Expose("Foo")]
	public int Bar;
}
```
This show how, for environments that support it, ossia objects can integrate
with existing property environments.

## Device callbacks
```c
```

```cpp--98
```

```cpp--14
#include <ossia/ossia.hpp>
#include <ossia/network/oscquery/oscquery_mirror.hpp>
...
struct MyObject
    : public Nano::Observer
{
  ossia::net::generic_device device;
  MyObject()
  {
    device.on_node_created.connect<MyObject, &MyObject::node_created>(*this);
    device.on_node_removing.connect<MyObject, &MyObject::node_removing>(*this);
  }

  void node_created(const ossia::net::node_base&) { }
  void node_removing(const ossia::net::node_base&) { }
}
```

```python
```

```qml
N/A
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
N/A
```

```plaintext--max
N/A
```

```smalltalk
```


Device callbacks can be used to react to creation or removal of nodes in a
given device.

## Remote OSCQuery Device
```c
#include <ossia-c/ossia-c.h>
...
ossia_protocol_t proto = ossia_protocol_oscquery_mirror_create("ws://localhost:5678");
ossia_device_t dev = ossia_device_create(proto, "my_mirror");
ossia_device_update_namespace(dev);
...
ossia_device_free(dev);
ossia_protocol_free(proto);
```

```cpp--98
#include <ossia-cpp/ossia-cpp98.hpp>
...
opp::oscquery_mirror mirror{"my_mirror", "ws://localhost:5678"};
mirror.refresh();
```

```cpp--14
#include <ossia/ossia.hpp>
#include <ossia/network/oscquery/oscquery_mirror.hpp>
...
ossia::net::generic_device dev{
    std::make_unique<ossia::oscquery::oscquery_mirror_protocol>("ws://localhost:5678"),
    "my_mirror"};
dev.get_protocol()->update(dev);
```

```python
```

```qml
import Ossia 1.0 as Ossia
...
Ossia.OSCQueryMirror {
    name: "my_mirror"
    host: "ws://localhost:5678"
}
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

This shows how to connect to an existing OSCquery device, and refresh the image that
we have of it.


# Advanced networking
## Midi
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to create the relevant protocol

## OSC

## OSCQuery instances
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to create and remove objects in reaction to OSCQuery messages

## Raw messages
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to send messages without the node actually existing in the tree, e.g. like a "basic" OSC library

## Pattern matching
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to send and receive messages according to OSC pattern matching parameteres


# Node attributes
This part presents the attributes that can be set on nodes and parameteres.

## Access mode

```c
```

```cpp--98
```

```cpp--14
ossia::net::node_base& node = ...;
ossia::net::set_access_mode(node, ossia::access_mode::BI);
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

An indicative value that says is a particular parameter should be considered
as :
* **GET** : read-only (e.g. a VU-meter)
* **SET** : write-only (e.g. a "Play" button)
* **BI** : read-write

The default is "BI".
Only meaningful for nodes with parameteres.

## Domain (min/max)

> This sets a node's range between -5 and 5.
```c
```

```cpp--98
```

```cpp--14
ossia::net::node_base& node = ...;
auto dom = ossia::net::make_domain(-5., 5.);
ossia::net::set_domain(node, dom);
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


> If the domain is an array, it is possible to filter per value, or with a single, shared, min / max.

```c
```

```cpp--98
```

```cpp--14
ossia::net::node_base& node = ...;
auto dom = ossia::net::make_domain({0, 0, 0}, {1, 10, 10});
ossia::net::set_domain(node, dom);
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

> Instead of a min / max, it is also possible to give a set of accepted values.
> Values that don't fit will be rounded to the closest accepted value.

```c
```

```cpp--98
```

```cpp--14
ossia::net::node_base& node = ...;

auto dom = ossia::net::init_domain(ossia::val_type::INT);
ossia::net::set_values(dom, {-1, 1, 2, 3, 5, 10});
ossia::net::set_domain(node, dom);
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

Domains allow to set a range of accepted values for a given parameter.
Only meaningful for nodes with parameteres.


## Clip mode

```c
```

```cpp--98
```

```cpp--14
ossia::net::node_base& node = ...;
ossia::net::set_bounding_mode(node, ossia::bounding_mode::CLIP);
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

The clip mode tells what happens when a value is outside of the min / max:

* **FREE** : no clipping; domain is only indicative.
* **CLIP** : clipped to the closest value in the range.
* **LOW** : only clips values lower than the min.
* **HIGH** : only clips values higher than the max.
* **WRAP** : ...
* **FOLD** : ...

The default is **FREE**.
## Repetition filter

```c
```

```cpp--98
```

```cpp--14
ossia::net::node_base& node = ...;
ossia::net::set_repetition_filter(node, ossia::repetition_filter::ON);
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

When the repetition filter is enabled, if the same value is sent twice,
the second time will be filtered.

## Units

```c
```

```cpp--98
```

```cpp--14
ossia::net::node_base& node = ...;

// every unit has a type
ossia::net::set_unit(node, ossia::rgba_u{});

// they can also be set from text
auto unit = ossia::parse_pretty_unit("color.hsv");
ossia::net::set_unit(node, unit);

```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

Units give a semantic meaning to the value of a parameter.

### List of units

Taken from Jamoma
#### Position

* cart2D
* cart3D
* spherical
* polar
* opengl
* cylindrical

#### Orientation

* quaternion:
* euler:
* axis:

#### Color

* argb: all between 0 - 1
* rgba:
* rgb:
* bgr:
* argb8: all between 0 - 255
* hsv:
* cmy8:
* todo: css? (rgb in 0, 1 and alpha in 0, 255)

#### Angle

* degree
* radian

#### Distance

* meter
* kilometer
* decimeter
* centimeter
* millimeter
* micrometer
* nanometer
* picometer
* inch
* foot
* mile

#### Time

* second
* bark
* bpm
* cent
* frequency
* mel
* midi_pitch
* millisecond
* playback_speed

#### Gain

* linear
* midigain
* decibel
* decibel_raw

#### Speed

* meter_per_second
* miles_per_hour
* kilometer_per_hour
* knot
* foot_per_second
* foot_per_hour

## Extended type

```c
```

```cpp--98
```

```cpp--14
ossia::net::node_base& node = ...;
ossia::net::set_extended_type(node, ossia::generic_buffer_type());
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

Extended types, just like units, are here to give an indicative meaning to a parameter.
They can also be used to enable some optimizations.

libossia proposes the following types:
* File path : used for when a string is a filesystem path, like `/home/self/sound.wav` or `c:\document.txt`
* Generic buffer : when a string should be interpreted as a a raw binary blob.
* Float array : when a parameter has a fixed number of floating point values, like vec2f.
* Float list : when a tuple consists exclusively of values of type float.
* Same for int list and string list.
* Dynamic array : when a tuple's size may change during execution.

## Instance bounds

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```



## Description

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Tags

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Priority

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Refresh rate

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Step size

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Default value

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Zombie

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Critical

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Disabled

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Hidden

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Muted

```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

# Preset support
## Loading a preset
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```

## Saving a preset

Being able to load & save preset files

## Preset instances
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to create new objects in reaction to the loading of a preset


# Utilities

## Logging
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to use the libossia logging facilities




