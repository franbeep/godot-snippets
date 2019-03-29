# A file is a class!

# Inheritance

extends BaseClass

# (optional) class definition with a custom icon

class_name MyClass, "res://path/to/optional/icon.svg"

# Member Variables

var a = 5
var s = "Hello"
var arr = [1, 2, 3]
var dict = {"key": "value", 2:3}
var typed_var: int
var inferred_type := "String"

# Constants

const ANSWER = 42
const THE_NAME = "Charly"

# Enums

enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

# Built-in Vector Types

var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)

# Function

func some_function(param1, param2):
    var local_var = 5

    if param1 < local_var:
        print(param1)
    elif param2 > 5:
        print(param2)
    else:
        print("Fail!")

    for i in range(20):
        print(i)

    while param2 != 0:
        param2 -= 1

    var local_var2 = param1 + 3
    return local_var2

# Functions override functions with the same name on the base/parent class.
# If you still want to call them, use '.' (like 'super' in other languages).

func something(p1, p2):
    .something(p1, p2)

# Inner Class

class Something:
    var a = 10

# Constructor

func _init():
    print("Constructed!")
    var lv = Something.new()
    print(lv.a)

# https://docs.godotengine.org/en/3.1/getting_started/scripting/gdscript/gdscript_basics.html#doc-gdscript


# Array
var arr = []
arr = [1, 2, 3]
var b = arr[1] # This is 2.
var c = arr[arr.size() - 1] # This is 3.
var d = arr[-1] # Same as the previous line, but shorter.
arr[0] = "Hi!" # Replacing value 1 with "Hi!".
arr.append(4) # Array is now ["Hi!", 2, 3, 4].

# Dictionary
d = {
    22: "value",
    "some_key": 2,
    "other_key": [2, 3, 4],
    "more_key": "Hello"
}
var d = {} # Create an empty Dictionary.
d.waiting = 14 # Add String "Waiting" as a key and assign the value 14 to it.
d[4] = "hello" # Add integer 4 as a key and assign the String "hello" as its value.
d["Godot"] = 3.01 # Add String "Godot" as a key and assign the value 3.01 to it.

# Cast
var my_node2D: Node2D
my_node2D = $Sprite as Node2D # Works since Sprite is a subtype of Node2D
var my_int: int
my_int = "123" as int # The string can be converted to int
my_int = Vector2() as int # A Vector2 can't be converted to int, this will cause an error

# Enum
enum {TILE_BRICK, TILE_FLOOR, TILE_SPIKE, TILE_TELEPORT}
# Is the same as:
const TILE_BRICK = 0
const TILE_FLOOR = 1
const TILE_SPIKE = 2
const TILE_TELEPORT = 3
enum State {STATE_IDLE, STATE_JUMP = 5, STATE_SHOOT}
# Is the same as:
const State = {STATE_IDLE = 0, STATE_JUMP = 5, STATE_SHOOT = 6}
# Access values with State.STATE_IDLE, etc.

# Functions
func my_function(a: int, b: String):
    pass
func my_function(int_arg := 42, String_arg := "string"):
    pass
func my_int_function() -> int:
    return 0
void_function() -> void:
    return # Can't return a value
# Call a function by name in one step.
my_node.call("my_function", args)
# Store a function reference.
var my_func = funcref(my_node, "my_function")
# Call stored function reference.
my_func.call_func(args)

# Match
match [expression]:
    [pattern](s):
        [block]
    [pattern](s):
        [block]
    [pattern](s):
        [block]
# -> constant pattern
match x:
    1:
        print("We are number one!")
    2:
        print("Two are better than one!")
    "test":
        print("Oh snap! It's a string!")
# -> variable pattern
match typeof(x):
    TYPE_REAL:
        print("float")
    TYPE_STRING:
        print("text")
    TYPE_ARRAY:
        print("array")
# -> wildcard pattern
match x:
    1:
        print("It's one!")
    2:
        print("It's one times two!")
    _:
        print("It's not 1 or 2. I don't care tbh.")
# -> binding pattern
match x:
    1:
        print("It's one!")
    2:
        print("It's one times two!")
    var new_var:
        print("It's not 1 or 2, it's ", new_var)
# -> array pattern
match x:
    []:
        print("Empty array")
    [1, 3, "test", null]:
        print("Very specific array")
    [var start, _, "test"]:
        print("First element is ", start, ", and the last is \"test\"")
    [42, ..]:
        print("Open ended array")
# -> dictionary pattern
match x:
    {}:
        print("Empty dict")
    {"name": "Dennis"}:
        print("The name is Dennis")
    {"name": "Dennis", "age": var age}:
        print("Dennis is ", age, " years old.")
    {"name", "age"}:
        print("Has a name and an age, but it's not Dennis :(")
    {"key": "godotisawesome", ..}:
        print("I only checked for one entry and ignored the rest")
# -> Multipatterns
match x:
    1, 2, 3:
        print("It's 1 - 3")
    "Sword", "Splash potion", "Fist":
        print("Yep, you've taken damage")


# Inheritance
# Inherit/extend a globally available class.
extends SomeClass

# Inherit/extend a named class file.
extends "somefile.gd"

# Inherit/extend an inner class in another file.
extends "somefile.gd".SomeInnerClass
func some_func(x):
    .some_func(x)

# Constructor
func _init(e=null, m=null).(e):
    # Do something with 'e'.
    message = m
func _init().(5):
    pass


# Exports
# If the exported value assigns a constant or constant expression,
# the type will be inferred and used in the editor.

export var number = 5

# Export can take a basic data type as an argument, which will be
# used in the editor.

export(int) var number

# Export can also take a resource type to use as a hint.

export(Texture) var character_face
export(PackedScene) var scene_file

# Integers and strings hint enumerated values.

# Editor will enumerate as 0, 1 and 2.
export(int, "Warrior", "Magician", "Thief") var character_class
# Editor will enumerate with string names.
export(String, "Rebecca", "Mary", "Leah") var character_name

# Named Enum Values

# Editor will enumerate as THING_1, THING_2, ANOTHER_THING.
enum NamedEnum {THING_1, THING_2, ANOTHER_THING = -1}
export (NamedEnum) var x

# Strings as Paths

# String is a path to a file.
export(String, FILE) var f
# String is a path to a directory.
export(String, DIR) var f
# String is a path to a file, custom filter provided as hint.
export(String, FILE, "*.txt") var f

# Using paths in the global filesystem is also possible,
# but only in tool scripts (see further below).

# String is a path to a PNG file in the global filesystem.
export(String, FILE, GLOBAL, "*.png") var tool_image
# String is a path to a directory in the global filesystem.
export(String, DIR, GLOBAL) var tool_dir

# The MULTILINE setting tells the editor to show a large input
# field for editing over multiple lines.
export(String, MULTILINE) var text

# Limiting editor input ranges

# Allow integer values from 0 to 20.
export(int, 20) var i
# Allow integer values from -10 to 20.
export(int, -10, 20) var j
# Allow floats from -10 to 20, with a step of 0.2.
export(float, -10, 20, 0.2) var k
# Allow values y = exp(x) where y varies between 100 and 1000
# while snapping to steps of 20. The editor will present a
# slider for easily editing the value.
export(float, EXP, 100, 1000, 20) var l

# Floats with Easing Hint

# Display a visual representation of the ease() function
# when editing.
export(float, EASE) var transition_speed

# Colors

# Color given as Red-Green-Blue value
export(Color, RGB) var col # Color is RGB.
# Color given as Red-Green-Blue-Alpha value
export(Color, RGBA) var col # Color is RGBA.

# Another node in the scene can be exported, too.
export(NodePath) var node


# Individually edit the bits of an integer.
export(int, FLAGS) var spell_elements = ELEMENT_WIND | ELEMENT_WATER

# Set any of the given flags from the editor.
export(int, FLAGS, "Fire", "Water", "Earth", "Wind") var spell_elements = 0

# Exported array, shared between all instances.
# Default value must be a constant expression.

export var a = [1, 2, 3]

# Exported arrays can specify type (using the same hints as before).

export(Array, int) var ints = [1,2,3]
export(Array, int, "Red", "Green", "Blue") var enums = [2, 1, 0]
export(Array, Array, float) var two_dimensional = [[1, 2], [3, 4]]

# You can omit the default value, but then it would be null if not assigned.

export(Array) var b
export(Array, PackedScene) var scenes

# Typed arrays also work, only initialized empty:

export var vector3s = PoolVector3Array()
export var strings = PoolStringArray()

# Regular array, created local for every instance.
# Default value can include run-time values, but can't
# be exported.

var c = [a, 2, 3]

# Setters/getters
var variable = value setget setterfunc, getterfunc
var myvar setget my_var_set, my_var_get

func my_var_set(new_value):
    my_var = new_value

func my_var_get():
    return my_var # Getter must return a value.
# Only a setter.
var my_var = 5 setget myvar_set
# Only a getter (note the comma).
var my_var = 5 setget ,myvar_get

# Tool
tool
extends Button

func _ready():
    print("Hello")

# Signals
# your_notifier.gd
signal data_found(data)

# Signal with two arguments
signal your_signal_name_with_args(a, b)

var your_data = 42

func _process(delta):
   if delta == your_data:
      emit_signal("data_found", data)
# your_handler.gd

func your_handler(data, obj):
    print("Your handler was called from: ", obj.get_name(), with data: ", data")

# your_game.gd
func _ready():
    var notifier = your_notifier.new()
    var handler = your_handler.new()

    notifier.connect("data_found", handler, "your_handler", [notifier])

# Yield
func my_func():
    print("Hello")
    print(yield())
    return "cheers!"
 
func _ready():
    var y = my_func()
    # Function state saved in 'y'.
    print(y.resume("world"))
    # 'y' resumed and is now an invalid state.

# Assert
# Check that 'i' is 0.
assert(i == 0)