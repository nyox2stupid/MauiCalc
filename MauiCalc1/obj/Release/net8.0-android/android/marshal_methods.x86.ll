; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [118 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [236 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 109
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 50
	i32 83839681, ; 5: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 104
	i32 136584136, ; 7: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 8: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 55
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 73
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 86
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 51
	i32 321963286, ; 14: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 62
	i32 379916513, ; 16: System.Threading.Thread.dll => 0x16a510e1 => 109
	i32 385762202, ; 17: System.Memory.dll => 0x16fe439a => 95
	i32 395744057, ; 18: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 19: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 20: System.Collections => 0x1a61054f => 83
	i32 450948140, ; 21: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 61
	i32 456227837, ; 22: System.Web.HttpUtility.dll => 0x1b317bfd => 111
	i32 469710990, ; 23: System.dll => 0x1bff388e => 113
	i32 489220957, ; 24: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 25: System.ObjectModel => 0x1dbae811 => 101
	i32 513247710, ; 26: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 44
	i32 538707440, ; 27: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 28: Microsoft.Extensions.Logging => 0x20216150 => 41
	i32 597488923, ; 29: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 30: Xamarin.AndroidX.CustomView => 0x2568904f => 59
	i32 627931235, ; 31: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 32: System.Collections.Concurrent => 0x2814a96c => 80
	i32 759454413, ; 33: System.Net.Requests => 0x2d445acd => 99
	i32 775507847, ; 34: System.IO.Compression => 0x2e394f87 => 92
	i32 777317022, ; 35: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 36: Microsoft.Extensions.Options => 0x2f0980eb => 43
	i32 804715423, ; 37: System.Data.Common => 0x2ff6fb9f => 88
	i32 823281589, ; 38: System.Private.Uri.dll => 0x311247b5 => 102
	i32 830298997, ; 39: System.IO.Compression.Brotli => 0x317d5b75 => 91
	i32 869139383, ; 40: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 41: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 42: System.ComponentModel.Primitives.dll => 0x35e25008 => 84
	i32 918734561, ; 43: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 44: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 45: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 62
	i32 982398321, ; 46: MauiCalc1 => 0x3a8e3571 => 79
	i32 990727110, ; 47: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 48: System.Collections.dll => 0x3b2c715c => 83
	i32 1012816738, ; 49: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 72
	i32 1028951442, ; 50: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 40
	i32 1035644815, ; 51: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 52
	i32 1043950537, ; 52: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 53: System.Linq.Expressions.dll => 0x3e444eb4 => 93
	i32 1052210849, ; 54: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 64
	i32 1082857460, ; 55: System.ComponentModel.TypeConverter => 0x408b17f4 => 85
	i32 1084122840, ; 56: Xamarin.Kotlin.StdLib => 0x409e66d8 => 77
	i32 1098259244, ; 57: System => 0x41761b2c => 113
	i32 1108272742, ; 58: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 59: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 60: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 61: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 62: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 69
	i32 1260983243, ; 63: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 64: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 60
	i32 1308624726, ; 65: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 66: System.Linq => 0x4eed2679 => 94
	i32 1336711579, ; 67: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 68: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 69: Xamarin.AndroidX.SavedState => 0x52114ed3 => 72
	i32 1406073936, ; 70: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 56
	i32 1430672901, ; 71: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 72: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 73: System.Collections.Immutable.dll => 0x5718a9ef => 81
	i32 1462112819, ; 74: System.IO.Compression.dll => 0x57261233 => 92
	i32 1469204771, ; 75: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 53
	i32 1470490898, ; 76: Microsoft.Extensions.Primitives => 0x57a5e912 => 44
	i32 1479771757, ; 77: System.Collections.Immutable => 0x5833866d => 81
	i32 1480492111, ; 78: System.IO.Compression.Brotli.dll => 0x583e844f => 91
	i32 1526286932, ; 79: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 80: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 108
	i32 1622152042, ; 81: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 66
	i32 1624863272, ; 82: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 75
	i32 1634654947, ; 83: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 84: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 58
	i32 1639515021, ; 85: System.Net.Http.dll => 0x61b9038d => 96
	i32 1639986890, ; 86: System.Text.RegularExpressions => 0x61c036ca => 108
	i32 1657153582, ; 87: System.Runtime => 0x62c6282e => 106
	i32 1658251792, ; 88: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 76
	i32 1677501392, ; 89: System.Net.Primitives.dll => 0x63fca3d0 => 98
	i32 1679769178, ; 90: System.Security.Cryptography => 0x641f3e5a => 107
	i32 1729485958, ; 91: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 54
	i32 1743415430, ; 92: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 93: System.Diagnostics.TraceSource.dll => 0x69239124 => 90
	i32 1766324549, ; 94: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 73
	i32 1770582343, ; 95: Microsoft.Extensions.Logging.dll => 0x6988f147 => 41
	i32 1780572499, ; 96: Mono.Android.Runtime.dll => 0x6a216153 => 116
	i32 1782862114, ; 97: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 98: Xamarin.AndroidX.Fragment => 0x6a96652d => 61
	i32 1793755602, ; 99: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 100: Xamarin.AndroidX.Loader => 0x6bcd3296 => 66
	i32 1813058853, ; 101: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 77
	i32 1813201214, ; 102: Xamarin.Google.Android.Material => 0x6c13413e => 76
	i32 1818569960, ; 103: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 70
	i32 1828688058, ; 104: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 42
	i32 1853025655, ; 105: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 106: System.Linq.Expressions => 0x6ec71a65 => 93
	i32 1875935024, ; 107: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 108: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 109: System.Collections.NonGeneric.dll => 0x71dc7c8b => 82
	i32 1953182387, ; 110: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 111: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 37
	i32 2003115576, ; 112: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 113: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 64
	i32 2025921463, ; 114: MauiCalc1.dll => 0x78c11bb7 => 79
	i32 2045470958, ; 115: System.Private.Xml => 0x79eb68ee => 103
	i32 2055257422, ; 116: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 63
	i32 2066184531, ; 117: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 118: System.Diagnostics.TraceSource => 0x7b6f419e => 90
	i32 2079903147, ; 119: System.Runtime.dll => 0x7bf8cdab => 106
	i32 2090596640, ; 120: System.Numerics.Vectors => 0x7c9bf920 => 100
	i32 2127167465, ; 121: System.Console => 0x7ec9ffe9 => 87
	i32 2159891885, ; 122: Microsoft.Maui => 0x80bd55ad => 48
	i32 2169148018, ; 123: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 124: Microsoft.Extensions.Options.dll => 0x820d22b3 => 43
	i32 2192057212, ; 125: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 42
	i32 2193016926, ; 126: System.ObjectModel.dll => 0x82b6c85e => 101
	i32 2201107256, ; 127: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 78
	i32 2201231467, ; 128: System.Net.Http => 0x8334206b => 96
	i32 2207618523, ; 129: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 130: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 38
	i32 2279755925, ; 131: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 71
	i32 2298471582, ; 132: System.Net.Mail => 0x88ffe49e => 97
	i32 2303942373, ; 133: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 134: System.Private.CoreLib.dll => 0x896b7878 => 114
	i32 2353062107, ; 135: System.Net.Primitives => 0x8c40e0db => 98
	i32 2366048013, ; 136: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 137: System.Xml.ReaderWriter.dll => 0x8d24e767 => 112
	i32 2371007202, ; 138: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 37
	i32 2395872292, ; 139: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 140: System.Web.HttpUtility => 0x8f24faee => 111
	i32 2427813419, ; 141: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 142: System.Console.dll => 0x912896e5 => 87
	i32 2475788418, ; 143: Java.Interop.dll => 0x93918882 => 115
	i32 2480646305, ; 144: Microsoft.Maui.Controls => 0x93dba8a1 => 46
	i32 2503351294, ; 145: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2550873716, ; 146: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2576534780, ; 147: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2593496499, ; 148: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 149: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 78
	i32 2617129537, ; 150: System.Private.Xml.dll => 0x9bfe3a41 => 103
	i32 2620871830, ; 151: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 58
	i32 2626831493, ; 152: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2676780864, ; 153: System.Data.Common.dll => 0x9f8c6f40 => 88
	i32 2724373263, ; 154: System.Runtime.Numerics.dll => 0xa262a30f => 105
	i32 2732626843, ; 155: Xamarin.AndroidX.Activity => 0xa2e0939b => 51
	i32 2737747696, ; 156: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 53
	i32 2740698338, ; 157: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 158: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 159: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 47
	i32 2764765095, ; 160: Microsoft.Maui.dll => 0xa4caf7a7 => 48
	i32 2778768386, ; 161: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 74
	i32 2785988530, ; 162: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 163: Microsoft.Maui.Graphics => 0xa7008e0b => 50
	i32 2810250172, ; 164: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 56
	i32 2853208004, ; 165: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 74
	i32 2861189240, ; 166: Microsoft.Maui.Essentials => 0xaa8a4878 => 49
	i32 2868488919, ; 167: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 168: System.Private.CoreLib => 0xad6f1e8a => 114
	i32 2916838712, ; 169: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 75
	i32 2919462931, ; 170: System.Numerics.Vectors.dll => 0xae037813 => 100
	i32 2959614098, ; 171: System.ComponentModel.dll => 0xb0682092 => 86
	i32 2978675010, ; 172: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 60
	i32 3038032645, ; 173: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 174: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 175: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 67
	i32 3059408633, ; 176: Mono.Android.Runtime => 0xb65adef9 => 116
	i32 3059793426, ; 177: System.ComponentModel.Primitives => 0xb660be12 => 84
	i32 3178803400, ; 178: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 68
	i32 3220365878, ; 179: System.Threading => 0xbff2e236 => 110
	i32 3258312781, ; 180: Xamarin.AndroidX.CardView => 0xc235e84d => 54
	i32 3305363605, ; 181: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 182: System.Net.Requests.dll => 0xc5b097e4 => 99
	i32 3317135071, ; 183: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 59
	i32 3346324047, ; 184: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 69
	i32 3357674450, ; 185: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 186: Xamarin.AndroidX.Core => 0xc86c06e3 => 57
	i32 3366347497, ; 187: Java.Interop => 0xc8a662e9 => 115
	i32 3374999561, ; 188: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 71
	i32 3381016424, ; 189: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 190: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 39
	i32 3452344032, ; 191: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 45
	i32 3458724246, ; 192: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 193: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 85
	i32 3476120550, ; 194: Mono.Android => 0xcf3163e6 => 117
	i32 3484440000, ; 195: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3580758918, ; 196: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 197: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 198: System.Linq.dll => 0xd715a361 => 94
	i32 3641597786, ; 199: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 63
	i32 3643446276, ; 200: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 201: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 68
	i32 3657292374, ; 202: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 38
	i32 3672681054, ; 203: Mono.Android.dll => 0xdae8aa5e => 117
	i32 3724971120, ; 204: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 67
	i32 3748608112, ; 205: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 89
	i32 3751619990, ; 206: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 207: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 55
	i32 3792276235, ; 208: System.Collections.NonGeneric => 0xe2098b0b => 82
	i32 3800979733, ; 209: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 45
	i32 3817368567, ; 210: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 211: System.Security.Cryptography.dll => 0xe3df9d2b => 107
	i32 3841636137, ; 212: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 40
	i32 3844307129, ; 213: System.Net.Mail.dll => 0xe52378b9 => 97
	i32 3849253459, ; 214: System.Runtime.InteropServices.dll => 0xe56ef253 => 104
	i32 3896106733, ; 215: System.Collections.Concurrent.dll => 0xe839deed => 80
	i32 3896760992, ; 216: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 57
	i32 3920221145, ; 217: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 218: System.Xml.ReaderWriter => 0xea213423 => 112
	i32 3931092270, ; 219: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 70
	i32 3955647286, ; 220: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 52
	i32 4025784931, ; 221: System.Memory => 0xeff49a63 => 95
	i32 4046471985, ; 222: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 47
	i32 4073602200, ; 223: System.Threading.dll => 0xf2ce3c98 => 110
	i32 4091086043, ; 224: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 225: Microsoft.Maui.Essentials.dll => 0xf40add04 => 49
	i32 4100113165, ; 226: System.Private.Uri => 0xf462c30d => 102
	i32 4103439459, ; 227: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 228: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 39
	i32 4150914736, ; 229: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 230: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 65
	i32 4213026141, ; 231: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 89
	i32 4249188766, ; 232: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 233: Microsoft.Maui.Controls.dll => 0xfea12dee => 46
	i32 4274976490, ; 234: System.Runtime.Numerics => 0xfecef6ea => 105
	i32 4292120959 ; 235: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 65
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [236 x i32] [
	i32 0, ; 0
	i32 9, ; 1
	i32 109, ; 2
	i32 33, ; 3
	i32 50, ; 4
	i32 17, ; 5
	i32 104, ; 6
	i32 32, ; 7
	i32 25, ; 8
	i32 55, ; 9
	i32 73, ; 10
	i32 86, ; 11
	i32 30, ; 12
	i32 51, ; 13
	i32 8, ; 14
	i32 62, ; 15
	i32 109, ; 16
	i32 95, ; 17
	i32 34, ; 18
	i32 28, ; 19
	i32 83, ; 20
	i32 61, ; 21
	i32 111, ; 22
	i32 113, ; 23
	i32 6, ; 24
	i32 101, ; 25
	i32 44, ; 26
	i32 27, ; 27
	i32 41, ; 28
	i32 35, ; 29
	i32 59, ; 30
	i32 19, ; 31
	i32 80, ; 32
	i32 99, ; 33
	i32 92, ; 34
	i32 25, ; 35
	i32 43, ; 36
	i32 88, ; 37
	i32 102, ; 38
	i32 91, ; 39
	i32 10, ; 40
	i32 24, ; 41
	i32 84, ; 42
	i32 21, ; 43
	i32 14, ; 44
	i32 62, ; 45
	i32 79, ; 46
	i32 23, ; 47
	i32 83, ; 48
	i32 72, ; 49
	i32 40, ; 50
	i32 52, ; 51
	i32 4, ; 52
	i32 93, ; 53
	i32 64, ; 54
	i32 85, ; 55
	i32 77, ; 56
	i32 113, ; 57
	i32 26, ; 58
	i32 20, ; 59
	i32 16, ; 60
	i32 22, ; 61
	i32 69, ; 62
	i32 2, ; 63
	i32 60, ; 64
	i32 11, ; 65
	i32 94, ; 66
	i32 31, ; 67
	i32 32, ; 68
	i32 72, ; 69
	i32 56, ; 70
	i32 0, ; 71
	i32 6, ; 72
	i32 81, ; 73
	i32 92, ; 74
	i32 53, ; 75
	i32 44, ; 76
	i32 81, ; 77
	i32 91, ; 78
	i32 30, ; 79
	i32 108, ; 80
	i32 66, ; 81
	i32 75, ; 82
	i32 36, ; 83
	i32 58, ; 84
	i32 96, ; 85
	i32 108, ; 86
	i32 106, ; 87
	i32 76, ; 88
	i32 98, ; 89
	i32 107, ; 90
	i32 54, ; 91
	i32 1, ; 92
	i32 90, ; 93
	i32 73, ; 94
	i32 41, ; 95
	i32 116, ; 96
	i32 17, ; 97
	i32 61, ; 98
	i32 9, ; 99
	i32 66, ; 100
	i32 77, ; 101
	i32 76, ; 102
	i32 70, ; 103
	i32 42, ; 104
	i32 26, ; 105
	i32 93, ; 106
	i32 8, ; 107
	i32 2, ; 108
	i32 82, ; 109
	i32 13, ; 110
	i32 37, ; 111
	i32 5, ; 112
	i32 64, ; 113
	i32 79, ; 114
	i32 103, ; 115
	i32 63, ; 116
	i32 4, ; 117
	i32 90, ; 118
	i32 106, ; 119
	i32 100, ; 120
	i32 87, ; 121
	i32 48, ; 122
	i32 12, ; 123
	i32 43, ; 124
	i32 42, ; 125
	i32 101, ; 126
	i32 78, ; 127
	i32 96, ; 128
	i32 14, ; 129
	i32 38, ; 130
	i32 71, ; 131
	i32 97, ; 132
	i32 18, ; 133
	i32 114, ; 134
	i32 98, ; 135
	i32 12, ; 136
	i32 112, ; 137
	i32 37, ; 138
	i32 13, ; 139
	i32 111, ; 140
	i32 10, ; 141
	i32 87, ; 142
	i32 115, ; 143
	i32 46, ; 144
	i32 16, ; 145
	i32 11, ; 146
	i32 15, ; 147
	i32 20, ; 148
	i32 78, ; 149
	i32 103, ; 150
	i32 58, ; 151
	i32 15, ; 152
	i32 88, ; 153
	i32 105, ; 154
	i32 51, ; 155
	i32 53, ; 156
	i32 1, ; 157
	i32 21, ; 158
	i32 47, ; 159
	i32 48, ; 160
	i32 74, ; 161
	i32 27, ; 162
	i32 50, ; 163
	i32 56, ; 164
	i32 74, ; 165
	i32 49, ; 166
	i32 36, ; 167
	i32 114, ; 168
	i32 75, ; 169
	i32 100, ; 170
	i32 86, ; 171
	i32 60, ; 172
	i32 34, ; 173
	i32 7, ; 174
	i32 67, ; 175
	i32 116, ; 176
	i32 84, ; 177
	i32 68, ; 178
	i32 110, ; 179
	i32 54, ; 180
	i32 7, ; 181
	i32 99, ; 182
	i32 59, ; 183
	i32 69, ; 184
	i32 24, ; 185
	i32 57, ; 186
	i32 115, ; 187
	i32 71, ; 188
	i32 3, ; 189
	i32 39, ; 190
	i32 45, ; 191
	i32 22, ; 192
	i32 85, ; 193
	i32 117, ; 194
	i32 23, ; 195
	i32 31, ; 196
	i32 33, ; 197
	i32 94, ; 198
	i32 63, ; 199
	i32 28, ; 200
	i32 68, ; 201
	i32 38, ; 202
	i32 117, ; 203
	i32 67, ; 204
	i32 89, ; 205
	i32 3, ; 206
	i32 55, ; 207
	i32 82, ; 208
	i32 45, ; 209
	i32 35, ; 210
	i32 107, ; 211
	i32 40, ; 212
	i32 97, ; 213
	i32 104, ; 214
	i32 80, ; 215
	i32 57, ; 216
	i32 19, ; 217
	i32 112, ; 218
	i32 70, ; 219
	i32 52, ; 220
	i32 95, ; 221
	i32 47, ; 222
	i32 110, ; 223
	i32 5, ; 224
	i32 49, ; 225
	i32 102, ; 226
	i32 29, ; 227
	i32 39, ; 228
	i32 29, ; 229
	i32 65, ; 230
	i32 89, ; 231
	i32 18, ; 232
	i32 46, ; 233
	i32 105, ; 234
	i32 65 ; 235
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
