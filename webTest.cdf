(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.4' *)

(*************************************************************************)
(*                                                                       *)
(*                                                                       *)
(*  This file was created under the Wolfram Enterprise licensing terms.  *)
(*                                                                       *)
(*       For additional information concerning CDF licensing see:        *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*                                                                       *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[    632467,      12652]
NotebookOptionsPosition[    632915,      12643]
NotebookOutlinePosition[    633394,      12664]
CellTagsIndexPosition[    633351,      12661]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[BoxData[
 RowBox[{" ", 
  RowBox[{"FayMenu", "=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "vals", ",", "lab", ",", "text", ",", "notes", ",", "plots", ",", 
       "temp"}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"dbOut", " ", "=", " ", 
       RowBox[{"ImportString", "[", 
        RowBox[{
         RowBox[{
         "URLFetch", "[", "\"\<localhost:3000/JSONendpoint\>\"", "]"}], ",", 
         "\"\<JSON\>\""}], "]"}]}], ";", "\[IndentingNewLine]", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"labels", " ", "[", "dbOut_", "]"}], ":=", " ", 
       RowBox[{"Module", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"t1", ",", "t2", ",", "axisLabelFormat"}], "}"}], ",", 
         RowBox[{
          RowBox[{"axisLabelFormat", ":=", 
           RowBox[{
            RowBox[{
             RowBox[{"#", "[", 
              RowBox[{"[", "1", "]"}], "]"}], "<>", "\"\< [\>\"", "<>", 
             RowBox[{"#", "[", 
              RowBox[{"[", "2", "]"}], "]"}], "<>", "\"\<]\>\""}], "&"}]}], 
          ";", "\[IndentingNewLine]", 
          RowBox[{"t1", "=", 
           RowBox[{"Map", "[", 
            RowBox[{"axisLabelFormat", ",", 
             RowBox[{"Lookup", "[", 
              RowBox[{"dbOut", ",", 
               RowBox[{"{", 
                RowBox[{
                "\"\<abcissa_label\>\"", ",", "\"\<abcissa_unit\>\""}], 
                "}"}]}], "]"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"t2", "=", 
           RowBox[{"Map", "[", 
            RowBox[{"axisLabelFormat", ",", 
             RowBox[{"Lookup", "[", 
              RowBox[{"dbOut", ",", 
               RowBox[{"{", 
                RowBox[{
                "\"\<ordinate_label\>\"", ",", "\"\<ordinate_unit\>\""}], 
                "}"}]}], "]"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"Transpose", "[", 
           RowBox[{"{", 
            RowBox[{"t1", ",", "t2"}], "}"}], "]"}]}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"nts", "[", "dbOut_", "]"}], ":=", 
       RowBox[{"Module", "[", 
        RowBox[{
         RowBox[{"{", "form", "}"}], ",", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"form", ":=", 
           RowBox[{
            RowBox[{"Panel", "[", 
             RowBox[{
              RowBox[{"Style", "[", 
               RowBox[{
                RowBox[{"\"\<Notes: \>\"", "<>", "#"}], ",", "White", ",", 
                "Bold", ",", "Italic", ",", "12"}], "]"}], ",", 
              RowBox[{"Background", "\[Rule]", 
               RowBox[{"RGBColor", "[", 
                RowBox[{"0.2", ",", "0.2", ",", "0.2"}], "]"}]}]}], "]"}], 
            "&"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"notes", "=", 
           RowBox[{"Lookup", "[", 
            RowBox[{"dbOut", ",", "\"\<original_notes\>\""}], "]"}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"Map", "[", 
           RowBox[{"form", ",", "notes"}], "]"}]}]}], "\[IndentingNewLine]", 
        "]"}]}], ";", "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"makeLabel", "[", "dbOut_", "]"}], ":=", 
       RowBox[{"Module", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"refs", ",", "labelText"}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"refs", " ", "=", 
           RowBox[{"Map", "[", 
            RowBox[{
             RowBox[{"Apply", "[", "Text", "]"}], ",", " ", 
             RowBox[{"\"\<original_reference\>\"", "/.", 
              RowBox[{"Lookup", "[", 
               RowBox[{"dbOut", ",", "\"\<reference\>\""}], "]"}]}]}], 
            "]"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"labelText", "=", 
           RowBox[{"Module", "[", 
            RowBox[{
             RowBox[{"{", "form", "}"}], ",", 
             RowBox[{
              RowBox[{"form", ":=", 
               RowBox[{
                RowBox[{"Panel", "[", 
                 RowBox[{
                  RowBox[{"Column", "[", 
                   RowBox[{
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"Style", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"#", "[", 
                    RowBox[{"[", "1", "]"}], "]"}], "<>", "\"\<-\>\"", "<>", 
                    RowBox[{"ToString", "[", 
                    RowBox[{"#", "[", 
                    RowBox[{"[", "2", "]"}], "]"}], "]"}], "<>", "\"\< \>\"", 
                    "<>", 
                    RowBox[{"#", "[", 
                    RowBox[{"[", "3", "]"}], "]"}]}], ",", "Bold", ",", 
                    "12"}], "]"}], ",", 
                    RowBox[{"Style", "[", 
                    RowBox[{
                    RowBox[{"#", "[", 
                    RowBox[{"[", "4", "]"}], "]"}], ",", "Italic", ",", 
                    "12"}], "]"}]}], "}"}], ",", "Left", ",", 
                    RowBox[{"Spacings", "\[Rule]", "1.5"}]}], "]"}], ",", 
                  RowBox[{"Background", "\[Rule]", "LightGray"}]}], "]"}], 
                "&"}]}], ";", "\[IndentingNewLine]", 
              RowBox[{"notes", "=", 
               RowBox[{"Lookup", "[", 
                RowBox[{"dbOut", ",", 
                 RowBox[{"{", 
                  RowBox[{
                  "\"\<record_number\>\"", ",", "\"\<data_number\>\"", ",", 
                   "\"\<record_title\>\"", ",", "\"\<data_title\>\"", ",", 
                   "\"\<original_notes\>\""}], "}"}]}], "]"}]}], ";", 
              "\[IndentingNewLine]", 
              RowBox[{"Map", "[", 
               RowBox[{"form", ",", "notes"}], "]"}]}]}], 
            "\[IndentingNewLine]", "]"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"Map", "[", 
           RowBox[{"Column", ",", 
            RowBox[{"Transpose", "[", 
             RowBox[{"{", 
              RowBox[{"labelText", ",", "refs"}], "}"}], "]"}]}], "]"}]}]}], 
        "\[IndentingNewLine]", "]"}]}], ";", "\[IndentingNewLine]", 
      "\[IndentingNewLine]", 
      RowBox[{"vals", "=", " ", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"\"\<abcissa_value\>\"", ",", "\"\<ordinate_value\>\""}], 
         "}"}], "/.", 
        RowBox[{"Lookup", "[", 
         RowBox[{"dbOut", ",", "\"\<data\>\""}], "]"}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"lab", " ", "=", " ", 
       RowBox[{"labels", "[", "dbOut", "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"text", "=", 
       RowBox[{"makeLabel", "[", "dbOut", "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"notes", "=", 
       RowBox[{"nts", "[", "dbOut", "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"plots", "=", 
       RowBox[{
        RowBox[{
         RowBox[{"Legended", "[", 
          RowBox[{
           RowBox[{"ListLogLinearPlot", "[", 
            RowBox[{
             RowBox[{"vals", "[", 
              RowBox[{"[", "#", "]"}], "]"}], ",", "\[IndentingNewLine]", 
             RowBox[{"Joined", "\[Rule]", "True"}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"AxesLabel", "\[Rule]", 
              RowBox[{"lab", "[", 
               RowBox[{"[", "#", "]"}], "]"}]}], ",", "\[IndentingNewLine]", 
             RowBox[{"PlotMarkers", "\[Rule]", 
              RowBox[{"Style", "[", 
               RowBox[{"\"\<*\>\"", ",", "Black", ",", "12"}], "]"}]}], ",", 
             RowBox[{"ImageSize", "\[Rule]", "Large"}]}], "]"}], ",", 
           RowBox[{"Placed", "[", 
            RowBox[{
             RowBox[{"notes", "[", 
              RowBox[{"[", "#", "]"}], "]"}], ",", "Below"}], "]"}]}], "]"}], 
         "&"}], "/@", 
        RowBox[{"Range", "[", 
         RowBox[{
          RowBox[{"Dimensions", "[", "vals", "]"}], "[", 
          RowBox[{"[", "1", "]"}], "]"}], "]"}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"temp", "=", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{"text", ",", "plots"}], "}"}], "]"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"Column", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"OpenerView", "[", 
          RowBox[{"temp", "[", 
           RowBox[{"[", "#", "]"}], "]"}], "]"}], "&"}], "/@", 
        RowBox[{"Range", "[", 
         RowBox[{
          RowBox[{"Dimensions", "[", "vals", "]"}], "[", 
          RowBox[{"[", "1", "]"}], "]"}], "]"}]}], "]"}]}]}], 
    "\[IndentingNewLine]", "\[IndentingNewLine]", "]"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-1 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Animal 1 - Rana catesbiana - bullfrog\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-1 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Animal 1 - Rana catesbiana - bullfrog\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{4.605170185988092, 55.8}, {5.298317366548036, 
                    39.9}, {6.396929655216146, 11.5}, {6.684611727667927, 
                    8.2}, {7.090076835776092, 20.5}, {7.3777589082278725`, 
                    13.5}, {8.006367567650246, 79.6}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{4.605170185988092, 
                    55.8}}, {{5.298317366548036, 39.9}}, {{6.396929655216146, 
                    11.5}}, {{6.684611727667927, 8.2}}, {{7.090076835776092, 
                    20.5}}, {{7.3777589082278725`, 13.5}}, {{
                    8.006367567650246, 79.6}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {4.480061037508984, 0}, 
                  PlotRange -> {{4.534311907203465, 8.006367567650246}, {
                    0, 79.6}}, PlotRangeClipping -> True, ImagePadding -> All,
                   DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox["\"SPL [dB]\"", TraditionalForm]}, 
                  AxesOrigin -> {4.480061037508984, 0}, DisplayFunction :> 
                  Identity, Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.912023005428146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.615805480084347, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.903487552536127, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{4.534311907203465, 8.006367567650246}, {
                    0, 79.6}}, PlotRangeClipping -> True, 
                  PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.912023005428146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.615805480084347, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.903487552536127, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: Thresholds were determined with the reflex \
inhibition method (see Yerkes, 1904, 1905) using the method of constant \
stimuli. In this paradigm, shock is used to elicit a movement reflex. \
Presentation of a pure tone before the shock (400 msec before for bullfrog, \
200 msec before for green tree frog) tends to reduce the shock-evoked reflex. \
Pure tones were 400 msec duration for bullfrog, and 200 msec for green tree \
frog, with 10 msec rise/fall times. The sound pressure level producing a \
reflex reduction of 10% was interpolated from reflex reduction functions of \
sound pressure level. These functions have slopes averaging 0.3 to 0.6 % per \
dB. These are the only audiograms for anurans determined using a true \
psychophysical method. See Fig. A9-0 for masked thresholds using the same \
methods.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A1-0-1 Behavioral audiograms using the reflex inhibition \
method for two anuran species (Megela Simmons, Moss, and Daniel, 1985)", Bold,
                 12], 
               Style["Animal 1 - Rana catesbiana - bullfrog", Italic, 12]}, 
              Left, Spacings -> 1.5], Background -> GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{4.605170185988092, 55.8}, {5.298317366548036, 39.9}, {
                  6.396929655216146, 11.5}, {6.684611727667927, 8.2}, {
                  7.090076835776092, 20.5}, {7.3777589082278725`, 13.5}, {
                  8.006367567650246, 79.6}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{4.605170185988092, 
                  55.8}}, {{5.298317366548036, 39.9}}, {{6.396929655216146, 
                  11.5}}, {{6.684611727667927, 8.2}}, {{7.090076835776092, 
                  20.5}}, {{7.3777589082278725`, 13.5}}, {{8.006367567650246, 
                  79.6}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {4.480061037508984, 0}, 
             PlotRange -> {{4.534311907203465, 8.006367567650246}, {0, 79.6}},
              PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {"Frequency [Hz]", "SPL [dB]"}, 
             AxesOrigin -> {4.480061037508984, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, 
                Automatic}, {{{4.605170185988092, 100, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 5.298317366548036, 200, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.214608098422191, 500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.907755278982137, 1000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.600902459542082, 2000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.912023005428146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.0943445622221, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.248495242049359, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.382026634673881, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.499809670330265, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.703782474656201, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.991464547107982, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.396929655216146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.551080335043404, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.684611727667927, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.802394763324311, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.313220387090301, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.006367567650246, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.294049640102028, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.517193191416238, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.699514748210191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.85366542803745, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.987196820661973, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.104979856318357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.210340371976184, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.615805480084347, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.903487552536127, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{4.534311907203465, 8.006367567650246}, {0, 79.6}},
              PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{4.605170185988092, 100, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                5.298317366548036, 200, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.214608098422191, 500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.907755278982137, 1000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.600902459542082, 2000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.912023005428146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.0943445622221, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.248495242049359, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.382026634673881, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.499809670330265, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.703782474656201, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.991464547107982, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.396929655216146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.551080335043404, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.684611727667927, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.802394763324311, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.313220387090301, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.006367567650246, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.294049640102028, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.517193191416238, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.699514748210191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.85366542803745, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.987196820661973, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.104979856318357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.210340371976184, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.615805480084347, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.903487552536127, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: Thresholds were determined with the reflex inhibition \
method (see Yerkes, 1904, 1905) using the method of constant stimuli. In this \
paradigm, shock is used to elicit a movement reflex. Presentation of a pure \
tone before the shock (400 msec before for bullfrog, 200 msec before for \
green tree frog) tends to reduce the shock-evoked reflex. Pure tones were 400 \
msec duration for bullfrog, and 200 msec for green tree frog, with 10 msec \
rise/fall times. The sound pressure level producing a reflex reduction of 10% \
was interpolated from reflex reduction functions of sound pressure level. \
These functions have slopes averaging 0.3 to 0.6 % per dB. These are the only \
audiograms for anurans determined using a true psychophysical method. See \
Fig. A9-0 for masked thresholds using the same methods.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-2 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Animal 2 - Rana catesbiana - bullfrog\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-2 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Animal 2 - Rana catesbiana - bullfrog\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{4.605170185988092, 63.1}, {5.298317366548036, 
                    45.1}, {5.703782474656201, 41.8}, {5.991464547107982, 
                    19.7}, {6.396929655216146, 6.6}, {6.684611727667927, 
                    25.4}, {7.090076835776092, 14.7}, {7.3777589082278725`, 
                    26.2}, {7.600902459542082, 40.2}, {8.006367567650246, 
                    69.7}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{4.605170185988092, 
                    63.1}}, {{5.298317366548036, 45.1}}, {{5.703782474656201, 
                    41.8}}, {{5.991464547107982, 19.7}}, {{6.396929655216146, 
                    6.6}}, {{6.684611727667927, 25.4}}, {{7.090076835776092, 
                    14.7}}, {{7.3777589082278725`, 26.2}}, {{
                    7.600902459542082, 40.2}}, {{8.006367567650246, 
                    69.7}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {4.480061037508984, 0}, 
                  PlotRange -> {{4.534311907203465, 8.006367567650246}, {
                    0, 69.7}}, PlotRangeClipping -> True, ImagePadding -> All,
                   DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox["\"SPL [dB]\"", TraditionalForm]}, 
                  AxesOrigin -> {4.480061037508984, 0}, DisplayFunction :> 
                  Identity, Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.912023005428146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.615805480084347, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.903487552536127, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{4.534311907203465, 8.006367567650246}, {
                    0, 69.7}}, PlotRangeClipping -> True, 
                  PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.912023005428146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.615805480084347, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.903487552536127, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: Thresholds were determined with the reflex \
inhibition method (see Yerkes, 1904, 1905) using the method of constant \
stimuli. In this paradigm, shock is used to elicit a movement reflex. \
Presentation of a pure tone before the shock (400 msec before for bullfrog, \
200 msec before for green tree frog) tends to reduce the shock-evoked reflex. \
Pure tones were 400 msec duration for bullfrog, and 200 msec for green tree \
frog, with 10 msec rise/fall times. The sound pressure level producing a \
reflex reduction of 10% was interpolated from reflex reduction functions of \
sound pressure level. These functions have slopes averaging 0.3 to 0.6 % per \
dB. These are the only audiograms for anurans determined using a true \
psychophysical method. See Fig. A9-0 for masked thresholds using the same \
methods.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A1-0-2 Behavioral audiograms using the reflex inhibition \
method for two anuran species (Megela Simmons, Moss, and Daniel, 1985)", Bold,
                 12], 
               Style["Animal 2 - Rana catesbiana - bullfrog", Italic, 12]}, 
              Left, Spacings -> 1.5], Background -> GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{4.605170185988092, 63.1}, {5.298317366548036, 45.1}, {
                  5.703782474656201, 41.8}, {5.991464547107982, 19.7}, {
                  6.396929655216146, 6.6}, {6.684611727667927, 25.4}, {
                  7.090076835776092, 14.7}, {7.3777589082278725`, 26.2}, {
                  7.600902459542082, 40.2}, {8.006367567650246, 69.7}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{4.605170185988092, 
                  63.1}}, {{5.298317366548036, 45.1}}, {{5.703782474656201, 
                  41.8}}, {{5.991464547107982, 19.7}}, {{6.396929655216146, 
                  6.6}}, {{6.684611727667927, 25.4}}, {{7.090076835776092, 
                  14.7}}, {{7.3777589082278725`, 26.2}}, {{7.600902459542082, 
                  40.2}}, {{8.006367567650246, 69.7}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {4.480061037508984, 0}, 
             PlotRange -> {{4.534311907203465, 8.006367567650246}, {0, 69.7}},
              PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {"Frequency [Hz]", "SPL [dB]"}, 
             AxesOrigin -> {4.480061037508984, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, 
                Automatic}, {{{4.605170185988092, 100, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 5.298317366548036, 200, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.214608098422191, 500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.907755278982137, 1000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.600902459542082, 2000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.912023005428146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.0943445622221, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.248495242049359, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.382026634673881, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.499809670330265, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.703782474656201, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.991464547107982, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.396929655216146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.551080335043404, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.684611727667927, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.802394763324311, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.313220387090301, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.006367567650246, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.294049640102028, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.517193191416238, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.699514748210191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.85366542803745, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.987196820661973, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.104979856318357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.210340371976184, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.615805480084347, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.903487552536127, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{4.534311907203465, 8.006367567650246}, {0, 69.7}},
              PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{4.605170185988092, 100, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                5.298317366548036, 200, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.214608098422191, 500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.907755278982137, 1000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.600902459542082, 2000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.912023005428146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.0943445622221, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.248495242049359, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.382026634673881, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.499809670330265, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.703782474656201, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.991464547107982, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.396929655216146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.551080335043404, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.684611727667927, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.802394763324311, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.313220387090301, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.006367567650246, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.294049640102028, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.517193191416238, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.699514748210191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.85366542803745, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.987196820661973, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.104979856318357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.210340371976184, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.615805480084347, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.903487552536127, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: Thresholds were determined with the reflex inhibition \
method (see Yerkes, 1904, 1905) using the method of constant stimuli. In this \
paradigm, shock is used to elicit a movement reflex. Presentation of a pure \
tone before the shock (400 msec before for bullfrog, 200 msec before for \
green tree frog) tends to reduce the shock-evoked reflex. Pure tones were 400 \
msec duration for bullfrog, and 200 msec for green tree frog, with 10 msec \
rise/fall times. The sound pressure level producing a reflex reduction of 10% \
was interpolated from reflex reduction functions of sound pressure level. \
These functions have slopes averaging 0.3 to 0.6 % per dB. These are the only \
audiograms for anurans determined using a true psychophysical method. See \
Fig. A9-0 for masked thresholds using the same methods.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-3 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Mean - Rana catesbiana - bullfrog\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-3 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Mean - Rana catesbiana - bullfrog\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{4.605170185988092, 48.4}, {5.703782474656201, 
                    45.1}, {6.396929655216146, 28.8}, {6.802394763324311, 
                    21.6}, {7.090076835776092, 40.3}, {7.3777589082278725`, 
                    43.6}, {8.006367567650246, 33.6}, {8.160518247477505, 
                    52.3}, {8.517193191416238, 64.8}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{4.605170185988092, 
                    48.4}}, {{5.703782474656201, 45.1}}, {{6.396929655216146, 
                    28.8}}, {{6.802394763324311, 21.6}}, {{7.090076835776092, 
                    40.3}}, {{7.3777589082278725`, 43.6}}, {{
                    8.006367567650246, 33.6}}, {{8.160518247477505, 52.3}}, {{
                    8.517193191416238, 64.8}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {4.4612709022597805`, 0}, 
                  PlotRange -> {{4.52366970670834, 8.517193191416238}, {
                    0, 64.8}}, PlotRangeClipping -> True, ImagePadding -> All,
                   DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox["\"SPL [dB]\"", TraditionalForm]}, 
                  AxesOrigin -> {4.4612709022597805`, 0}, DisplayFunction :> 
                  Identity, Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox["5000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{4.52366970670834, 8.517193191416238}, {
                    0, 64.8}}, PlotRangeClipping -> True, 
                  PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox["5000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: Thresholds were determined with the reflex \
inhibition method (see Yerkes, 1904, 1905) using the method of constant \
stimuli. In this paradigm, shock is used to elicit a movement reflex. \
Presentation of a pure tone before the shock (400 msec before for bullfrog, \
200 msec before for green tree frog) tends to reduce the shock-evoked reflex. \
Pure tones were 400 msec duration for bullfrog, and 200 msec for green tree \
frog, with 10 msec rise/fall times. The sound pressure level producing a \
reflex reduction of 10% was interpolated from reflex reduction functions of \
sound pressure level. These functions have slopes averaging 0.3 to 0.6 % per \
dB. These are the only audiograms for anurans determined using a true \
psychophysical method. See Fig. A9-0 for masked thresholds using the same \
methods.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A1-0-3 Behavioral audiograms using the reflex inhibition \
method for two anuran species (Megela Simmons, Moss, and Daniel, 1985)", Bold,
                 12], 
               Style["Mean - Rana catesbiana - bullfrog", Italic, 12]}, Left, 
              Spacings -> 1.5], Background -> GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{4.605170185988092, 48.4}, {5.703782474656201, 45.1}, {
                  6.396929655216146, 28.8}, {6.802394763324311, 21.6}, {
                  7.090076835776092, 40.3}, {7.3777589082278725`, 43.6}, {
                  8.006367567650246, 33.6}, {8.160518247477505, 52.3}, {
                  8.517193191416238, 64.8}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{4.605170185988092, 
                  48.4}}, {{5.703782474656201, 45.1}}, {{6.396929655216146, 
                  28.8}}, {{6.802394763324311, 21.6}}, {{7.090076835776092, 
                  40.3}}, {{7.3777589082278725`, 43.6}}, {{8.006367567650246, 
                  33.6}}, {{8.160518247477505, 52.3}}, {{8.517193191416238, 
                  64.8}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {4.4612709022597805`, 0}, 
             PlotRange -> {{4.52366970670834, 8.517193191416238}, {0, 64.8}}, 
             PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {"Frequency [Hz]", "SPL [dB]"}, 
             AxesOrigin -> {4.4612709022597805`, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, 
                Automatic}, {{{4.605170185988092, 100, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 5.298317366548036, 200, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.214608098422191, 500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.907755278982137, 1000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.600902459542082, 2000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 8.517193191416238, 5000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.703782474656201, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.991464547107982, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.396929655216146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.551080335043404, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.684611727667927, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.802394763324311, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.313220387090301, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.006367567650246, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.294049640102028, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.699514748210191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.85366542803745, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.987196820661973, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.104979856318357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.210340371976184, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{4.52366970670834, 8.517193191416238}, {0, 64.8}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{4.605170185988092, 100, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                5.298317366548036, 200, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.214608098422191, 500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.907755278982137, 1000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.600902459542082, 2000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                8.517193191416238, 5000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.703782474656201, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.991464547107982, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.396929655216146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.551080335043404, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.684611727667927, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.802394763324311, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.313220387090301, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.006367567650246, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.294049640102028, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.699514748210191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.85366542803745, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.987196820661973, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.104979856318357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.210340371976184, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: Thresholds were determined with the reflex inhibition \
method (see Yerkes, 1904, 1905) using the method of constant stimuli. In this \
paradigm, shock is used to elicit a movement reflex. Presentation of a pure \
tone before the shock (400 msec before for bullfrog, 200 msec before for \
green tree frog) tends to reduce the shock-evoked reflex. Pure tones were 400 \
msec duration for bullfrog, and 200 msec for green tree frog, with 10 msec \
rise/fall times. The sound pressure level producing a reflex reduction of 10% \
was interpolated from reflex reduction functions of sound pressure level. \
These functions have slopes averaging 0.3 to 0.6 % per dB. These are the only \
audiograms for anurans determined using a true psychophysical method. See \
Fig. A9-0 for masked thresholds using the same methods.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-4 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Animal 1 - Hyla cinerea - green tree frog\"\
\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-4 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Animal 1 - Hyla cinerea - green tree frog\"\
\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{5.703782474656201, 58.5}, {6.396929655216146, 
                    36.9}, {6.802394763324311, 26.2}, {7.090076835776092, 
                    45.5}, {7.3777589082278725`, 38.}, {7.8632667240095735`, 
                    55.1}, {8.006367567650246, 46.2}, {8.242756345714477, 
                    57.2}, {8.517193191416238, 73.8}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{5.703782474656201, 
                    58.5}}, {{6.396929655216146, 36.9}}, {{6.802394763324311, 
                    26.2}}, {{7.090076835776092, 45.5}}, {{
                    7.3777589082278725`, 38.}}, {{7.8632667240095735`, 
                    55.1}}, {{8.006367567650246, 46.2}}, {{8.242756345714477, 
                    57.2}}, {{8.517193191416238, 73.8}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {5.600294385139964, 0}, 
                  PlotRange -> {{5.645169751390368, 8.517193191416238}, {
                    0, 73.8}}, PlotRangeClipping -> True, ImagePadding -> All,
                   DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox["\"SPL [dB]\"", TraditionalForm]}, 
                  AxesOrigin -> {5.600294385139964, 0}, DisplayFunction :> 
                  Identity, Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox["5000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{5.645169751390368, 8.517193191416238}, {
                    0, 73.8}}, PlotRangeClipping -> True, 
                  PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox["5000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: Thresholds were determined with the reflex \
inhibition method (see Yerkes, 1904, 1905) using the method of constant \
stimuli. In this paradigm, shock is used to elicit a movement reflex. \
Presentation of a pure tone before the shock (400 msec before for bullfrog, \
200 msec before for green tree frog) tends to reduce the shock-evoked reflex. \
Pure tones were 400 msec duration for bullfrog, and 200 msec for green tree \
frog, with 10 msec rise/fall times. The sound pressure level producing a \
reflex reduction of 10% was interpolated from reflex reduction functions of \
sound pressure level. These functions have slopes averaging 0.3 to 0.6 % per \
dB. These are the only audiograms for anurans determined using a true \
psychophysical method. See Fig. A9-0 for masked thresholds using the same \
methods.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A1-0-4 Behavioral audiograms using the reflex inhibition \
method for two anuran species (Megela Simmons, Moss, and Daniel, 1985)", Bold,
                 12], 
               Style[
               "Animal 1 - Hyla cinerea - green tree frog", Italic, 12]}, 
              Left, Spacings -> 1.5], Background -> GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{5.703782474656201, 58.5}, {6.396929655216146, 36.9}, {
                  6.802394763324311, 26.2}, {7.090076835776092, 45.5}, {
                  7.3777589082278725`, 38.}, {7.8632667240095735`, 55.1}, {
                  8.006367567650246, 46.2}, {8.242756345714477, 57.2}, {
                  8.517193191416238, 73.8}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{5.703782474656201, 
                  58.5}}, {{6.396929655216146, 36.9}}, {{6.802394763324311, 
                  26.2}}, {{7.090076835776092, 45.5}}, {{7.3777589082278725`, 
                  38.}}, {{7.8632667240095735`, 55.1}}, {{8.006367567650246, 
                  46.2}}, {{8.242756345714477, 57.2}}, {{8.517193191416238, 
                  73.8}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {5.600294385139964, 0}, 
             PlotRange -> {{5.645169751390368, 8.517193191416238}, {0, 73.8}},
              PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {"Frequency [Hz]", "SPL [dB]"}, 
             AxesOrigin -> {5.600294385139964, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, 
                Automatic}, {{{6.214608098422191, 500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.907755278982137, 1000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.600902459542082, 2000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 8.517193191416238, 5000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.298317366548036, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.703782474656201, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.991464547107982, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.396929655216146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.551080335043404, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.684611727667927, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.802394763324311, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.313220387090301, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.006367567650246, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.294049640102028, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.699514748210191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.85366542803745, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.987196820661973, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.104979856318357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.210340371976184, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{5.645169751390368, 8.517193191416238}, {0, 73.8}},
              PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{6.214608098422191, 500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.907755278982137, 1000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.600902459542082, 2000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                8.517193191416238, 5000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.298317366548036, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.703782474656201, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.991464547107982, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.396929655216146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.551080335043404, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.684611727667927, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.802394763324311, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.313220387090301, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.006367567650246, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.294049640102028, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.699514748210191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.85366542803745, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.987196820661973, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.104979856318357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.210340371976184, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: Thresholds were determined with the reflex inhibition \
method (see Yerkes, 1904, 1905) using the method of constant stimuli. In this \
paradigm, shock is used to elicit a movement reflex. Presentation of a pure \
tone before the shock (400 msec before for bullfrog, 200 msec before for \
green tree frog) tends to reduce the shock-evoked reflex. Pure tones were 400 \
msec duration for bullfrog, and 200 msec for green tree frog, with 10 msec \
rise/fall times. The sound pressure level producing a reflex reduction of 10% \
was interpolated from reflex reduction functions of sound pressure level. \
These functions have slopes averaging 0.3 to 0.6 % per dB. These are the only \
audiograms for anurans determined using a true psychophysical method. See \
Fig. A9-0 for masked thresholds using the same methods.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-5 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Animal 2 - Hyla cinerea - green tree frog\"\
\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-5 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Animal 2 - Hyla cinerea - green tree frog\"\
\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{4.605170185988092, 59.5}, {5.298317366548036, 
                    42.5}, {5.703782474656201, 41.8}, {5.991464547107982, 
                    19.7}, {6.396929655216146, 9.1}, {6.684611727667927, 
                    16.8}, {7.090076835776092, 17.6}, {7.3777589082278725`, 
                    19.9}, {7.600902459542082, 40.2}, {8.006367567650246, 
                    74.7}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{4.605170185988092, 
                    59.5}}, {{5.298317366548036, 42.5}}, {{5.703782474656201, 
                    41.8}}, {{5.991464547107982, 19.7}}, {{6.396929655216146, 
                    9.1}}, {{6.684611727667927, 16.8}}, {{7.090076835776092, 
                    17.6}}, {{7.3777589082278725`, 19.9}}, {{
                    7.600902459542082, 40.2}}, {{8.006367567650246, 
                    74.7}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {4.480061037508984, 0}, 
                  PlotRange -> {{4.534311907203465, 8.006367567650246}, {
                    0, 74.7}}, PlotRangeClipping -> True, ImagePadding -> All,
                   DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox["\"SPL [dB]\"", TraditionalForm]}, 
                  AxesOrigin -> {4.480061037508984, 0}, DisplayFunction :> 
                  Identity, Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.912023005428146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.615805480084347, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.903487552536127, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{4.534311907203465, 8.006367567650246}, {
                    0, 74.7}}, PlotRangeClipping -> True, 
                  PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.912023005428146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.615805480084347, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.903487552536127, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: Thresholds were determined with the reflex \
inhibition method (see Yerkes, 1904, 1905) using the method of constant \
stimuli. In this paradigm, shock is used to elicit a movement reflex. \
Presentation of a pure tone before the shock (400 msec before for bullfrog, \
200 msec before for green tree frog) tends to reduce the shock-evoked reflex. \
Pure tones were 400 msec duration for bullfrog, and 200 msec for green tree \
frog, with 10 msec rise/fall times. The sound pressure level producing a \
reflex reduction of 10% was interpolated from reflex reduction functions of \
sound pressure level. These functions have slopes averaging 0.3 to 0.6 % per \
dB. These are the only audiograms for anurans determined using a true \
psychophysical method. See Fig. A9-0 for masked thresholds using the same \
methods.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A1-0-5 Behavioral audiograms using the reflex inhibition \
method for two anuran species (Megela Simmons, Moss, and Daniel, 1985)", Bold,
                 12], 
               Style[
               "Animal 2 - Hyla cinerea - green tree frog", Italic, 12]}, 
              Left, Spacings -> 1.5], Background -> GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{4.605170185988092, 59.5}, {5.298317366548036, 42.5}, {
                  5.703782474656201, 41.8}, {5.991464547107982, 19.7}, {
                  6.396929655216146, 9.1}, {6.684611727667927, 16.8}, {
                  7.090076835776092, 17.6}, {7.3777589082278725`, 19.9}, {
                  7.600902459542082, 40.2}, {8.006367567650246, 74.7}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{4.605170185988092, 
                  59.5}}, {{5.298317366548036, 42.5}}, {{5.703782474656201, 
                  41.8}}, {{5.991464547107982, 19.7}}, {{6.396929655216146, 
                  9.1}}, {{6.684611727667927, 16.8}}, {{7.090076835776092, 
                  17.6}}, {{7.3777589082278725`, 19.9}}, {{7.600902459542082, 
                  40.2}}, {{8.006367567650246, 74.7}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {4.480061037508984, 0}, 
             PlotRange -> {{4.534311907203465, 8.006367567650246}, {0, 74.7}},
              PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {"Frequency [Hz]", "SPL [dB]"}, 
             AxesOrigin -> {4.480061037508984, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, 
                Automatic}, {{{4.605170185988092, 100, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 5.298317366548036, 200, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.214608098422191, 500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.907755278982137, 1000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.600902459542082, 2000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.912023005428146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.0943445622221, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.248495242049359, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.382026634673881, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.499809670330265, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.703782474656201, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.991464547107982, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.396929655216146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.551080335043404, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.684611727667927, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.802394763324311, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.313220387090301, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.006367567650246, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.294049640102028, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.517193191416238, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.699514748210191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.85366542803745, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.987196820661973, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.104979856318357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.210340371976184, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.615805480084347, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.903487552536127, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{4.534311907203465, 8.006367567650246}, {0, 74.7}},
              PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{4.605170185988092, 100, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                5.298317366548036, 200, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.214608098422191, 500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.907755278982137, 1000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.600902459542082, 2000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.912023005428146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.0943445622221, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.248495242049359, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.382026634673881, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.499809670330265, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.703782474656201, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.991464547107982, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.396929655216146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.551080335043404, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.684611727667927, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.802394763324311, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.313220387090301, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.006367567650246, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.294049640102028, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.517193191416238, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.699514748210191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.85366542803745, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.987196820661973, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.104979856318357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.210340371976184, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.615805480084347, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.903487552536127, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: Thresholds were determined with the reflex inhibition \
method (see Yerkes, 1904, 1905) using the method of constant stimuli. In this \
paradigm, shock is used to elicit a movement reflex. Presentation of a pure \
tone before the shock (400 msec before for bullfrog, 200 msec before for \
green tree frog) tends to reduce the shock-evoked reflex. Pure tones were 400 \
msec duration for bullfrog, and 200 msec for green tree frog, with 10 msec \
rise/fall times. The sound pressure level producing a reflex reduction of 10% \
was interpolated from reflex reduction functions of sound pressure level. \
These functions have slopes averaging 0.3 to 0.6 % per dB. These are the only \
audiograms for anurans determined using a true psychophysical method. See \
Fig. A9-0 for masked thresholds using the same methods.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-6 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Mean - Hyla cinerea - green tree frog\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A1-0-6 Behavioral audiograms using the \
reflex inhibition method for two anuran species (Megela Simmons, Moss, and \
Daniel, 1985)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Mean - Hyla cinerea - green tree frog\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A., Moss, C.F., and Daniel, \
K.M. (1985)  Behavioral audiograms of the bullfrog (Rana catesbeiana) and the \
green tree frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{4.605170185988092, 48.4}, {5.703782474656201, 
                    51.8}, {6.396929655216146, 32.9}, {6.802394763324311, 
                    23.9}, {7.090076835776092, 42.9}, {7.3777589082278725`, 
                    40.8}, {7.8632667240095735`, 55.1}, {8.006367567650246, 
                    39.9}, {8.160518247477505, 52.3}, {8.242756345714477, 
                    57.2}, {8.517193191416238, 69.3}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{4.605170185988092, 
                    48.4}}, {{5.703782474656201, 51.8}}, {{6.396929655216146, 
                    32.9}}, {{6.802394763324311, 23.9}}, {{7.090076835776092, 
                    42.9}}, {{7.3777589082278725`, 40.8}}, {{
                    7.8632667240095735`, 55.1}}, {{8.006367567650246, 
                    39.9}}, {{8.160518247477505, 52.3}}, {{8.242756345714477, 
                    57.2}}, {{8.517193191416238, 69.3}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {4.4612709022597805`, 0}, 
                  PlotRange -> {{4.52366970670834, 8.517193191416238}, {
                    0, 69.3}}, PlotRangeClipping -> True, ImagePadding -> All,
                   DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox["\"SPL [dB]\"", TraditionalForm]}, 
                  AxesOrigin -> {4.4612709022597805`, 0}, DisplayFunction :> 
                  Identity, Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox["5000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{4.52366970670834, 8.517193191416238}, {
                    0, 69.3}}, PlotRangeClipping -> True, 
                  PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox["5000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: Thresholds were determined with the reflex \
inhibition method (see Yerkes, 1904, 1905) using the method of constant \
stimuli. In this paradigm, shock is used to elicit a movement reflex. \
Presentation of a pure tone before the shock (400 msec before for bullfrog, \
200 msec before for green tree frog) tends to reduce the shock-evoked reflex. \
Pure tones were 400 msec duration for bullfrog, and 200 msec for green tree \
frog, with 10 msec rise/fall times. The sound pressure level producing a \
reflex reduction of 10% was interpolated from reflex reduction functions of \
sound pressure level. These functions have slopes averaging 0.3 to 0.6 % per \
dB. These are the only audiograms for anurans determined using a true \
psychophysical method. See Fig. A9-0 for masked thresholds using the same \
methods.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A1-0-6 Behavioral audiograms using the reflex inhibition \
method for two anuran species (Megela Simmons, Moss, and Daniel, 1985)", Bold,
                 12], 
               Style["Mean - Hyla cinerea - green tree frog", Italic, 12]}, 
              Left, Spacings -> 1.5], Background -> GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A., Moss, C.F., and Daniel, K.M. (1985)  \
Behavioral audiograms of the bullfrog (Rana catesbeiana) and the green tree \
frog (Hyla cinerea).  J. Acoust Soc. Amer. 78, 1236-1244."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{4.605170185988092, 48.4}, {5.703782474656201, 51.8}, {
                  6.396929655216146, 32.9}, {6.802394763324311, 23.9}, {
                  7.090076835776092, 42.9}, {7.3777589082278725`, 40.8}, {
                  7.8632667240095735`, 55.1}, {8.006367567650246, 39.9}, {
                  8.160518247477505, 52.3}, {8.242756345714477, 57.2}, {
                  8.517193191416238, 69.3}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{4.605170185988092, 
                  48.4}}, {{5.703782474656201, 51.8}}, {{6.396929655216146, 
                  32.9}}, {{6.802394763324311, 23.9}}, {{7.090076835776092, 
                  42.9}}, {{7.3777589082278725`, 40.8}}, {{
                  7.8632667240095735`, 55.1}}, {{8.006367567650246, 39.9}}, {{
                  8.160518247477505, 52.3}}, {{8.242756345714477, 57.2}}, {{
                  8.517193191416238, 69.3}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {4.4612709022597805`, 0}, 
             PlotRange -> {{4.52366970670834, 8.517193191416238}, {0, 69.3}}, 
             PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {"Frequency [Hz]", "SPL [dB]"}, 
             AxesOrigin -> {4.4612709022597805`, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, 
                Automatic}, {{{4.605170185988092, 100, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 5.298317366548036, 200, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.214608098422191, 500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.907755278982137, 1000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.600902459542082, 2000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 8.517193191416238, 5000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.703782474656201, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.991464547107982, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.396929655216146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.551080335043404, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.684611727667927, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.802394763324311, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.313220387090301, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.006367567650246, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.294049640102028, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.699514748210191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.85366542803745, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.987196820661973, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.104979856318357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.210340371976184, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{4.52366970670834, 8.517193191416238}, {0, 69.3}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{4.605170185988092, 100, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                5.298317366548036, 200, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.214608098422191, 500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.907755278982137, 1000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.600902459542082, 2000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                8.517193191416238, 5000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.703782474656201, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.991464547107982, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.396929655216146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.551080335043404, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.684611727667927, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.802394763324311, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.313220387090301, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.006367567650246, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.294049640102028, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.699514748210191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.85366542803745, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.987196820661973, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.104979856318357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.210340371976184, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: Thresholds were determined with the reflex inhibition \
method (see Yerkes, 1904, 1905) using the method of constant stimuli. In this \
paradigm, shock is used to elicit a movement reflex. Presentation of a pure \
tone before the shock (400 msec before for bullfrog, 200 msec before for \
green tree frog) tends to reduce the shock-evoked reflex. Pure tones were 400 \
msec duration for bullfrog, and 200 msec for green tree frog, with 10 msec \
rise/fall times. The sound pressure level producing a reflex reduction of 10% \
was interpolated from reflex reduction functions of sound pressure level. \
These functions have slopes averaging 0.3 to 0.6 % per dB. These are the only \
audiograms for anurans determined using a true psychophysical method. See \
Fig. A9-0 for masked thresholds using the same methods.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A8-0-1 The effect of playback intensity on \
evoked calling behavior in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Total evoked calls, all 30 trials\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1984)  Behavioral vocal \
response thresholds to mating calls in the bullfrog, Rana catesbeiana.  J. \
Acoust. Soc. Amer. 76, 676-681.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1984)  Behavioral vocal response \
thresholds to mating calls in the bullfrog, Rana catesbeiana.  J. Acoust. \
Soc. Amer. 76, 676-681."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A8-0-1 The effect of playback intensity on \
evoked calling behavior in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    StyleBox["\<\"Total evoked calls, all 30 trials\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1984)  Behavioral vocal \
response thresholds to mating calls in the bullfrog, Rana catesbeiana.  J. \
Acoust. Soc. Amer. 76, 676-681.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1984)  Behavioral vocal response \
thresholds to mating calls in the bullfrog, Rana catesbeiana.  J. Acoust. \
Soc. Amer. 76, 676-681."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{3.912023005428146, 0.}, {4.0943445622221, 
                    176.}, {4.248495242049359, 907.}, {4.382026634673881, 
                    4539.}, {4.499809670330265, 3697.}, {4.605170185988092, 
                    399.}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{3.912023005428146, 
                    0.}}, {{4.0943445622221, 176.}}, {{4.248495242049359, 
                    907.}}, {{4.382026634673881, 4539.}}, {{4.499809670330265,
                     3697.}}, {{4.605170185988092, 399.}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {3.8865263806223935`, 0}, 
                  PlotRange -> {{3.897582439166481, 4.605170185988092}, {
                    0, 4539.}}, PlotRangeClipping -> True, ImagePadding -> 
                  All, DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Playback Level  [dB SPL]\"", TraditionalForm], 
                    
                    FormBox[
                    "\"Number of vocalizations [Thousands]\"", 
                    TraditionalForm]}, AxesOrigin -> {3.8865263806223935`, 0},
                   DisplayFunction :> Identity, 
                  Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{3.912023005428146, 
                    FormBox["50", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox["60", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox["70", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox["80", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox["90", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.7376696182833684`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.784189633918261, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.828641396489095, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.871201010907891, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.9512437185814275`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.9889840465642745`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.02535169073515, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.060443010546419, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.127134385045092, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.1588830833596715`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.189654742026425, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.219507705176107, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.276666119016055, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.30406509320417, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.330733340286331, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.356708826689592, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.406719247264253, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.430816798843313, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.454347296253507, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.477336814478207, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.5217885770490405`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.543294782270004, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.564348191467836, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.584967478670572, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.624972813284271, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.6443908991413725`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.663439094112067, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.68213122712422, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.700480365792417, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{3.897582439166481, 4.605170185988092}, {
                    0, 4539.}}, PlotRangeClipping -> True, 
                  PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{3.912023005428146, 
                    FormBox["50", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox["60", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox["70", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox["80", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox["90", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.7376696182833684`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.784189633918261, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.828641396489095, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.871201010907891, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.9512437185814275`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.9889840465642745`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.02535169073515, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.060443010546419, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.127134385045092, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.1588830833596715`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.189654742026425, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.219507705176107, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.276666119016055, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.30406509320417, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.330733340286331, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.356708826689592, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.406719247264253, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.430816798843313, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.454347296253507, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.477336814478207, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.5217885770490405`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.543294782270004, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.564348191467836, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.584967478670572, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.624972813284271, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.6443908991413725`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.663439094112067, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.68213122712422, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.700480365792417, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: Male bullfrogs will vocalize in response to the \
advertisement calls of male conspecifics. In this laboratory experiment, six \
adult males were presented with tape recordings of conspecific advertisement \
calls broadcast at the indicated overall sound pressure levels. Recorded \
calls (one trial) were five individual croaks separated by 0.5 sec intervals. \
One 30 trial session at a given intensity was presented every 40 min. \
Clearly, calls broadcast at 80 dB SPL are the most effective. Comparing total \
calls to the calls evoked on the first trial of each session gives an \
indication of the degree of habituation occurring in this experiment.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A8-0-1 The effect of playback intensity on evoked calling \
behavior in Rana catesbeiana (bullfrog).", Bold, 12], 
               Style["Total evoked calls, all 30 trials", Italic, 12]}, Left, 
              Spacings -> 1.5], Background -> GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A. (1984)  Behavioral vocal response thresholds \
to mating calls in the bullfrog, Rana catesbeiana.  J. Acoust. Soc. Amer. 76, \
676-681."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{3.912023005428146, 0.}, {4.0943445622221, 176.}, {
                  4.248495242049359, 907.}, {4.382026634673881, 4539.}, {
                  4.499809670330265, 3697.}, {4.605170185988092, 399.}}]}}, {{
                
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{3.912023005428146, 
                  0.}}, {{4.0943445622221, 176.}}, {{4.248495242049359, 
                  907.}}, {{4.382026634673881, 4539.}}, {{4.499809670330265, 
                  3697.}}, {{4.605170185988092, 399.}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {3.8865263806223935`, 0}, 
             PlotRange -> {{3.897582439166481, 4.605170185988092}, {
               0, 4539.}}, PlotRangeClipping -> True, ImagePadding -> All, 
             DisplayFunction -> Identity, AspectRatio -> GoldenRatio^(-1), 
             Axes -> {True, True}, 
             AxesLabel -> {
              "Playback Level  [dB SPL]", 
               "Number of vocalizations [Thousands]"}, 
             AxesOrigin -> {3.8865263806223935`, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, Automatic}, {{{3.912023005428146, 50, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.0943445622221, 60, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.248495242049359, 70, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.382026634673881, 80, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.499809670330265, 90, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.605170185988092, 100, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.7376696182833684`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.784189633918261, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.828641396489095, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.871201010907891, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.9512437185814275`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.9889840465642745`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.02535169073515, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.060443010546419, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.127134385045092, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.1588830833596715`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.189654742026425, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.219507705176107, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.276666119016055, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.30406509320417, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.330733340286331, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.356708826689592, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.406719247264253, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.430816798843313, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.454347296253507, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.477336814478207, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.5217885770490405`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.543294782270004, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.564348191467836, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.584967478670572, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.624972813284271, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.6443908991413725`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.663439094112067, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.68213122712422, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.700480365792417, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{3.897582439166481, 4.605170185988092}, {
               0, 4539.}}, PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{3.912023005428146, 50, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.0943445622221, 60, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                4.248495242049359, 70, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                4.382026634673881, 80, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                4.499809670330265, 90, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                4.605170185988092, 100, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.7376696182833684`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.784189633918261, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.828641396489095, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.871201010907891, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.9512437185814275`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.9889840465642745`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.02535169073515, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.060443010546419, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.127134385045092, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.1588830833596715`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.189654742026425, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.219507705176107, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.276666119016055, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.30406509320417, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.330733340286331, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.356708826689592, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.406719247264253, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.430816798843313, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.454347296253507, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.477336814478207, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.5217885770490405`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.543294782270004, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.564348191467836, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.584967478670572, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.624972813284271, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.6443908991413725`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.663439094112067, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.68213122712422, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.700480365792417, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: Male bullfrogs will vocalize in response to the \
advertisement calls of male conspecifics. In this laboratory experiment, six \
adult males were presented with tape recordings of conspecific advertisement \
calls broadcast at the indicated overall sound pressure levels. Recorded \
calls (one trial) were five individual croaks separated by 0.5 sec intervals. \
One 30 trial session at a given intensity was presented every 40 min. \
Clearly, calls broadcast at 80 dB SPL are the most effective. Comparing total \
calls to the calls evoked on the first trial of each session gives an \
indication of the degree of habituation occurring in this experiment.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A8-0-2 The effect of playback intensity on \
evoked calling behavior in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Total evoked calls, first of 30 trials for \
each animal\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1984)  Behavioral vocal \
response thresholds to mating calls in the bullfrog, Rana catesbeiana.  J. \
Acoust. Soc. Amer. 76, 676-681.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1984)  Behavioral vocal response \
thresholds to mating calls in the bullfrog, Rana catesbeiana.  J. Acoust. \
Soc. Amer. 76, 676-681."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A8-0-2 The effect of playback intensity on \
evoked calling behavior in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Total evoked calls, first of 30 trials for \
each animal\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1984)  Behavioral vocal \
response thresholds to mating calls in the bullfrog, Rana catesbeiana.  J. \
Acoust. Soc. Amer. 76, 676-681.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1984)  Behavioral vocal response \
thresholds to mating calls in the bullfrog, Rana catesbeiana.  J. Acoust. \
Soc. Amer. 76, 676-681."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{3.912023005428146, 0.}, {4.0943445622221, 
                    47.}, {4.248495242049359, 170.}, {4.382026634673881, 
                    449.}, {4.499809670330265, 661.}, {4.605170185988092, 
                    164.}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{3.912023005428146, 
                    0.}}, {{4.0943445622221, 47.}}, {{4.248495242049359, 
                    170.}}, {{4.382026634673881, 449.}}, {{4.499809670330265, 
                    661.}}, {{4.605170185988092, 164.}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {3.8865263806223935`, 0}, 
                  PlotRange -> {{3.897582439166481, 4.605170185988092}, {
                    0, 661.}}, PlotRangeClipping -> True, ImagePadding -> All,
                   DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Playback Level  [dB SPL]\"", TraditionalForm], 
                    
                    FormBox[
                    "\"Number of vocalizations [Thousands]\"", 
                    TraditionalForm]}, AxesOrigin -> {3.8865263806223935`, 0},
                   DisplayFunction :> Identity, 
                  Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{3.912023005428146, 
                    FormBox["50", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox["60", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox["70", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox["80", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox["90", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.7376696182833684`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.784189633918261, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.828641396489095, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.871201010907891, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.9512437185814275`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.9889840465642745`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.02535169073515, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.060443010546419, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.127134385045092, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.1588830833596715`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.189654742026425, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.219507705176107, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.276666119016055, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.30406509320417, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.330733340286331, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.356708826689592, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.406719247264253, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.430816798843313, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.454347296253507, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.477336814478207, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.5217885770490405`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.543294782270004, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.564348191467836, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.584967478670572, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.624972813284271, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.6443908991413725`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.663439094112067, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.68213122712422, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.700480365792417, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{3.897582439166481, 4.605170185988092}, {
                    0, 661.}}, PlotRangeClipping -> True, 
                  PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{3.912023005428146, 
                    FormBox["50", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox["60", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox["70", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox["80", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox["90", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.7376696182833684`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.784189633918261, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.828641396489095, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.871201010907891, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.9512437185814275`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.9889840465642745`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.02535169073515, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.060443010546419, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.127134385045092, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.1588830833596715`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.189654742026425, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.219507705176107, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.276666119016055, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.30406509320417, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.330733340286331, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.356708826689592, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.406719247264253, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.430816798843313, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.454347296253507, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.477336814478207, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.5217885770490405`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.543294782270004, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.564348191467836, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.584967478670572, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.624972813284271, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.6443908991413725`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.663439094112067, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.68213122712422, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.700480365792417, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: Male bullfrogs will vocalize in response to the \
advertisement calls of male conspecifics. In this laboratory experiment, six \
adult males were presented with tape recordings of conspecific advertisement \
calls broadcast at the indicated overall sound pressure levels. Recorded \
calls (one trial) were five individual croaks separated by 0.5 sec intervals. \
One 30 trial session at a given intensity was presented every 40 min. \
Clearly, calls broadcast at 80 dB SPL are the most effective. Comparing total \
calls to the calls evoked on the first trial of each session gives an \
indication of the degree of habituation occurring in this experiment.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A8-0-2 The effect of playback intensity on evoked calling \
behavior in Rana catesbeiana (bullfrog).", Bold, 12], 
               Style[
               "Total evoked calls, first of 30 trials for each animal", 
                Italic, 12]}, Left, Spacings -> 1.5], Background -> 
             GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A. (1984)  Behavioral vocal response thresholds \
to mating calls in the bullfrog, Rana catesbeiana.  J. Acoust. Soc. Amer. 76, \
676-681."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{3.912023005428146, 0.}, {4.0943445622221, 47.}, {
                  4.248495242049359, 170.}, {4.382026634673881, 449.}, {
                  4.499809670330265, 661.}, {4.605170185988092, 164.}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{3.912023005428146, 
                  0.}}, {{4.0943445622221, 47.}}, {{4.248495242049359, 
                  170.}}, {{4.382026634673881, 449.}}, {{4.499809670330265, 
                  661.}}, {{4.605170185988092, 164.}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {3.8865263806223935`, 0}, 
             PlotRange -> {{3.897582439166481, 4.605170185988092}, {0, 661.}},
              PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {
              "Playback Level  [dB SPL]", 
               "Number of vocalizations [Thousands]"}, 
             AxesOrigin -> {3.8865263806223935`, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, Automatic}, {{{3.912023005428146, 50, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.0943445622221, 60, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.248495242049359, 70, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.382026634673881, 80, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.499809670330265, 90, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 4.605170185988092, 100, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.7376696182833684`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.784189633918261, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.828641396489095, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.871201010907891, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.9512437185814275`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.9889840465642745`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.02535169073515, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.060443010546419, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.127134385045092, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.1588830833596715`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.189654742026425, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.219507705176107, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.276666119016055, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.30406509320417, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.330733340286331, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.356708826689592, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.406719247264253, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.430816798843313, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.454347296253507, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.477336814478207, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.5217885770490405`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.543294782270004, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.564348191467836, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.584967478670572, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.624972813284271, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.6443908991413725`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.663439094112067, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.68213122712422, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.700480365792417, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{3.897582439166481, 4.605170185988092}, {0, 661.}},
              PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{3.912023005428146, 50, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.0943445622221, 60, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                4.248495242049359, 70, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                4.382026634673881, 80, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                4.499809670330265, 90, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                4.605170185988092, 100, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.7376696182833684`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.784189633918261, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.828641396489095, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.871201010907891, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.9512437185814275`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.9889840465642745`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.02535169073515, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.060443010546419, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.127134385045092, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.1588830833596715`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.189654742026425, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.219507705176107, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.276666119016055, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.30406509320417, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.330733340286331, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.356708826689592, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.406719247264253, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.430816798843313, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.454347296253507, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.477336814478207, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.5217885770490405`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.543294782270004, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.564348191467836, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.584967478670572, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.624972813284271, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.6443908991413725`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.663439094112067, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.68213122712422, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.700480365792417, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: Male bullfrogs will vocalize in response to the \
advertisement calls of male conspecifics. In this laboratory experiment, six \
adult males were presented with tape recordings of conspecific advertisement \
calls broadcast at the indicated overall sound pressure levels. Recorded \
calls (one trial) were five individual croaks separated by 0.5 sec intervals. \
One 30 trial session at a given intensity was presented every 40 min. \
Clearly, calls broadcast at 80 dB SPL are the most effective. Comparing total \
calls to the calls evoked on the first trial of each session gives an \
indication of the degree of habituation occurring in this experiment.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-1 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog. 25 dB/Hz \
noise spectrum level (Moss and Megela Simmons, 1986) \"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Moss, C.F. & Megela Simmons, A. (1986)  \
Frequency selectivity of hearing in the green treefrog, Hyla cinerea.  J. \
Comp. Physiol. 159, 257-266.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Moss, C.F. & Megela Simmons, A. (1986)  Frequency \
selectivity of hearing in the green treefrog, Hyla cinerea.  J. Comp. \
Physiol. 159, 257-266."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-1 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog. 25 dB/Hz \
noise spectrum level (Moss and Megela Simmons, 1986) \"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Moss, C.F. & Megela Simmons, A. (1986)  \
Frequency selectivity of hearing in the green treefrog, Hyla cinerea.  J. \
Comp. Physiol. 159, 257-266.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Moss, C.F. & Megela Simmons, A. (1986)  Frequency \
selectivity of hearing in the green treefrog, Hyla cinerea.  J. Comp. \
Physiol. 159, 257-266."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{5.703782474656201, 36.5}, {6.396929655216146, 
                    27.2}, {6.802394763324311, 22.7}, {7.090076835776092, 
                    25.}, {7.495541943884256, 37.}, {8.006367567650246, 
                    26.}, {8.1886891244442, 30.9}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{5.703782474656201, 
                    36.5}}, {{6.396929655216146, 27.2}}, {{6.802394763324311, 
                    22.7}}, {{7.090076835776092, 25.}}, {{7.495541943884256, 
                    37.}}, {{8.006367567650246, 26.}}, {{8.1886891244442, 
                    30.9}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.05], 
                    Scaled[0.05]}}, 
                  AxesOrigin -> {5.61237803083262, 21.984999999999996`}, 
                  PlotRange -> {{5.652013586118951, 8.1886891244442}, {22.7, 
                   37.}}, PlotRangeClipping -> True, ImagePadding -> All, 
                  DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox[
                    "\"Signal-to-Noise Ratio at Threshold [dB]\"", 
                    TraditionalForm]}, 
                  AxesOrigin -> {5.61237803083262, 21.984999999999996`}, 
                  DisplayFunction :> Identity, 
                  Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{6.551080335043404, 
                    FormBox["700", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.438383530044307, 
                    FormBox["1700", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.90100705199242, 
                    FormBox["2700", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.824046010856292, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.160518247477505, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.411832675758411, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{5.652013586118951, 8.1886891244442}, {22.7, 
                   37.}}, PlotRangeClipping -> True, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.05], 
                    Scaled[0.05]}}, Ticks -> {{{6.551080335043404, 
                    FormBox["700", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.438383530044307, 
                    FormBox["1700", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.90100705199242, 
                    FormBox["2700", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.824046010856292, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.160518247477505, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.411832675758411, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: These thresholds were determined using the \
reflex inhibition technique used in Fig. A1-0 (see Notes) to determine \
audiograms in anurans. Flat spectrum noise was present continuously, and \
signals were tone bursts with 10 msec rise/fall times presented 200 msec \
preceding the shock (the reflex-eliciting stimulus). Method of constant \
stimuli. Threshold defined as a 10% reflex inhibition. The critical masking \
ratio is the difference (in dB) between the sound pressure level of the tone \
at threshold and the spectrum level (dB/Hz) of the masking noise. The \
similarity of curves 1 and 2 indicate that the critical masking ratio is \
nearly independent of noise level in this intensity range. N=10\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A9-0-1 The masking of tones and tone complexes by noise in \
the auditory system of Hyla cinerea (green tree frog), and in Rana \
catesbeiana (bullfrog).", Bold, 12], 
               Style[
               "Hyla cinerea - green tree frog. 25 dB/Hz noise spectrum level \
(Moss and Megela Simmons, 1986) ", Italic, 12]}, Left, Spacings -> 1.5], 
             Background -> GrayLevel[0.85]], 
            Text[
            "Moss, C.F. & Megela Simmons, A. (1986)  Frequency selectivity of \
hearing in the green treefrog, Hyla cinerea.  J. Comp. Physiol. 159, \
257-266."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{5.703782474656201, 36.5}, {6.396929655216146, 27.2}, {
                  6.802394763324311, 22.7}, {7.090076835776092, 25.}, {
                  7.495541943884256, 37.}, {8.006367567650246, 26.}, {
                  8.1886891244442, 30.9}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{5.703782474656201, 
                  36.5}}, {{6.396929655216146, 27.2}}, {{6.802394763324311, 
                  22.7}}, {{7.090076835776092, 25.}}, {{7.495541943884256, 
                  37.}}, {{8.006367567650246, 26.}}, {{8.1886891244442, 
                  30.9}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.05], 
                Scaled[0.05]}}, 
             AxesOrigin -> {5.61237803083262, 21.984999999999996`}, 
             PlotRange -> {{5.652013586118951, 8.1886891244442}, {22.7, 37.}},
              PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {
              "Frequency [Hz]", "Signal-to-Noise Ratio at Threshold [dB]"}, 
             AxesOrigin -> {5.61237803083262, 21.984999999999996`}, 
             DisplayFunction :> Identity, 
             Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, 
                Automatic}, {{{6.551080335043404, 700, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.438383530044307, 1700, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.90100705199242, 2700, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.907755278982137, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.313220387090301, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.600902459542082, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.824046010856292, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.006367567650246, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.160518247477505, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.294049640102028, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.411832675758411, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.517193191416238, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.699514748210191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.85366542803745, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.987196820661973, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{5.652013586118951, 8.1886891244442}, {22.7, 37.}},
              PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.05], 
                Scaled[0.05]}}, 
             Ticks -> {{{6.551080335043404, 700, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.438383530044307, 1700, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.90100705199242, 2700, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.907755278982137, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.313220387090301, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.600902459542082, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.824046010856292, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.006367567650246, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.160518247477505, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.294049640102028, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.411832675758411, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.517193191416238, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.699514748210191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.85366542803745, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.987196820661973, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: These thresholds were determined using the reflex \
inhibition technique used in Fig. A1-0 (see Notes) to determine audiograms in \
anurans. Flat spectrum noise was present continuously, and signals were tone \
bursts with 10 msec rise/fall times presented 200 msec preceding the shock \
(the reflex-eliciting stimulus). Method of constant stimuli. Threshold \
defined as a 10% reflex inhibition. The critical masking ratio is the \
difference (in dB) between the sound pressure level of the tone at threshold \
and the spectrum level (dB/Hz) of the masking noise. The similarity of curves \
1 and 2 indicate that the critical masking ratio is nearly independent of \
noise level in this intensity range. N=10", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-2 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog. 35 dB/Hz \
noise spectrum level (Moss and Megela Simmons, 1986) \"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Moss, C.F. & Megela Simmons, A. (1986)  \
Frequency selectivity of hearing in the green treefrog, Hyla cinerea.  J. \
Comp. Physiol. 159, 257-266.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Moss, C.F. & Megela Simmons, A. (1986)  Frequency \
selectivity of hearing in the green treefrog, Hyla cinerea.  J. Comp. \
Physiol. 159, 257-266."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-2 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog. 35 dB/Hz \
noise spectrum level (Moss and Megela Simmons, 1986) \"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Moss, C.F. & Megela Simmons, A. (1986)  \
Frequency selectivity of hearing in the green treefrog, Hyla cinerea.  J. \
Comp. Physiol. 159, 257-266.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Moss, C.F. & Megela Simmons, A. (1986)  Frequency \
selectivity of hearing in the green treefrog, Hyla cinerea.  J. Comp. \
Physiol. 159, 257-266."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{5.703782474656201, 33.}, {6.396929655216146, 
                    22.}, {6.802394763324311, 20.9}, {7.090076835776092, 
                    24.1}, {7.495541943884256, 35.5}, {8.006367567650246, 
                    21.9}, {8.1886891244442, 30.}, {8.517193191416238, 
                    49.}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{5.703782474656201, 
                    33.}}, {{6.396929655216146, 22.}}, {{6.802394763324311, 
                    20.9}}, {{7.090076835776092, 24.1}}, {{7.495541943884256, 
                    35.5}}, {{8.006367567650246, 21.9}}, {{8.1886891244442, 
                    30.}}, {{8.517193191416238, 49.}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {5.600294385139964, 0}, 
                  PlotRange -> {{5.645169751390368, 8.517193191416238}, {
                    0, 49.}}, PlotRangeClipping -> True, ImagePadding -> All, 
                  DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox[
                    "\"Signal-to-Noise Ratio at Threshold [dB]\"", 
                    TraditionalForm]}, AxesOrigin -> {5.600294385139964, 0}, 
                  DisplayFunction :> Identity, 
                  Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox["5000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{5.645169751390368, 8.517193191416238}, {
                    0, 49.}}, PlotRangeClipping -> True, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox["5000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: These thresholds were determined using the \
reflex inhibition technique used in Fig. A1-0 (see Notes) to determine \
audiograms in anurans. Flat spectrum noise was present continuously, and \
signals were tone bursts with 10 msec rise/fall times presented 200 msec \
preceding the shock (the reflex-eliciting stimulus). Method of constant \
stimuli. Threshold defined as a 10% reflex inhibition. The critical masking \
ratio is the difference (in dB) between the sound pressure level of the tone \
at threshold and the spectrum level (dB/Hz) of the masking noise. The \
similarity of curves 1 and 2 indicate that the critical masking ratio is \
nearly independent of noise level in this intensity range. N=7\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A9-0-2 The masking of tones and tone complexes by noise in \
the auditory system of Hyla cinerea (green tree frog), and in Rana \
catesbeiana (bullfrog).", Bold, 12], 
               Style[
               "Hyla cinerea - green tree frog. 35 dB/Hz noise spectrum level \
(Moss and Megela Simmons, 1986) ", Italic, 12]}, Left, Spacings -> 1.5], 
             Background -> GrayLevel[0.85]], 
            Text[
            "Moss, C.F. & Megela Simmons, A. (1986)  Frequency selectivity of \
hearing in the green treefrog, Hyla cinerea.  J. Comp. Physiol. 159, \
257-266."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{5.703782474656201, 33.}, {6.396929655216146, 22.}, {
                  6.802394763324311, 20.9}, {7.090076835776092, 24.1}, {
                  7.495541943884256, 35.5}, {8.006367567650246, 21.9}, {
                  8.1886891244442, 30.}, {8.517193191416238, 49.}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{5.703782474656201, 
                  33.}}, {{6.396929655216146, 22.}}, {{6.802394763324311, 
                  20.9}}, {{7.090076835776092, 24.1}}, {{7.495541943884256, 
                  35.5}}, {{8.006367567650246, 21.9}}, {{8.1886891244442, 
                  30.}}, {{8.517193191416238, 49.}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {5.600294385139964, 0}, 
             PlotRange -> {{5.645169751390368, 8.517193191416238}, {0, 49.}}, 
             PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {
              "Frequency [Hz]", "Signal-to-Noise Ratio at Threshold [dB]"}, 
             AxesOrigin -> {5.600294385139964, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, 
                Automatic}, {{{6.214608098422191, 500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.907755278982137, 1000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.600902459542082, 2000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 8.517193191416238, 5000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.298317366548036, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.703782474656201, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.991464547107982, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.396929655216146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.551080335043404, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.684611727667927, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.802394763324311, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.313220387090301, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.006367567650246, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.294049640102028, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.699514748210191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.85366542803745, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.987196820661973, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.104979856318357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.210340371976184, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{5.645169751390368, 8.517193191416238}, {0, 49.}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{6.214608098422191, 500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.907755278982137, 1000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.600902459542082, 2000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                8.517193191416238, 5000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.298317366548036, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.703782474656201, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.991464547107982, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.396929655216146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.551080335043404, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.684611727667927, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.802394763324311, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.313220387090301, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.006367567650246, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.294049640102028, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.699514748210191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.85366542803745, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.987196820661973, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.104979856318357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.210340371976184, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: These thresholds were determined using the reflex \
inhibition technique used in Fig. A1-0 (see Notes) to determine audiograms in \
anurans. Flat spectrum noise was present continuously, and signals were tone \
bursts with 10 msec rise/fall times presented 200 msec preceding the shock \
(the reflex-eliciting stimulus). Method of constant stimuli. Threshold \
defined as a 10% reflex inhibition. The critical masking ratio is the \
difference (in dB) between the sound pressure level of the tone at threshold \
and the spectrum level (dB/Hz) of the masking noise. The similarity of curves \
1 and 2 indicate that the critical masking ratio is nearly independent of \
noise level in this intensity range. N=7", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-3 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog. 25 -55dB/Hz \
noise spectrum level (Ehret and Gerhardt, 1980) \"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Ehret, G. & Gerhardt, H.C. (1980)  Auditory \
masking and effects of noise on responses of the green treefrog (Hyla \
cinerea) to synthetic mating calls.  J. Comp. Physiol. 141, 13-18.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Ehret, G. & Gerhardt, H.C. (1980)  Auditory masking and \
effects of noise on responses of the green treefrog (Hyla cinerea) to \
synthetic mating calls.  J. Comp. Physiol. 141, 13-18."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-3 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog. 25 -55dB/Hz \
noise spectrum level (Ehret and Gerhardt, 1980) \"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Ehret, G. & Gerhardt, H.C. (1980)  Auditory \
masking and effects of noise on responses of the green treefrog (Hyla \
cinerea) to synthetic mating calls.  J. Comp. Physiol. 141, 13-18.\"\>", 
                    TextForm]], "InlineText"],
                  Text[
                  "Ehret, G. & Gerhardt, H.C. (1980)  Auditory masking and \
effects of noise on responses of the green treefrog (Hyla cinerea) to \
synthetic mating calls.  J. Comp. Physiol. 141, 13-18."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{6.802394763324311, 22.}, {8.006367567650246, 
                    21.5}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{6.802394763324311, 
                    22.}}, {{8.006367567650246, 21.5}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.05], 
                    Scaled[0.05]}}, 
                  AxesOrigin -> {6.758108003269355, 21.474999999999998`}, 
                  PlotRange -> {{6.777311996567521, 8.006367567650246}, {21.5,
                    22.}}, PlotRangeClipping -> True, ImagePadding -> All, 
                  DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox[
                    "\"Signal-to-Noise Ratio at Threshold [dB]\"", 
                    TraditionalForm]}, 
                  AxesOrigin -> {6.758108003269355, 21.474999999999998`}, 
                  DisplayFunction :> Identity, 
                  Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox["1500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.824046010856292, 
                    FormBox["2500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox["3000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.003065458786462, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.090076835776092, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.170119543449628, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.24422751560335, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.3777589082278725`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.438383530044307, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.495541943884256, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.549609165154532, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.649692623711514, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.696212639346407, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.7406644019172415`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.783224016336037, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.8632667240095735`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.90100705199242, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.937374696163295, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.9724660159745655`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{6.777311996567521, 8.006367567650246}, {21.5,
                    22.}}, PlotRangeClipping -> True, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.05], 
                    Scaled[0.05]}}, Ticks -> {{{6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox["1500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.824046010856292, 
                    FormBox["2500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox["3000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.003065458786462, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.090076835776092, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.170119543449628, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.24422751560335, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.3777589082278725`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.438383530044307, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.495541943884256, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.549609165154532, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.649692623711514, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.696212639346407, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.7406644019172415`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.783224016336037, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.8632667240095735`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.90100705199242, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.937374696163295, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.9724660159745655`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: These masked thresholds were determined using \
the unconditioned response of females to approach the source of sounds having \
some similarity to the male mating calls. Tones of fixed intensity were \
introduced against a continuous broad band noise background, and the noise \
level increased until the tone failed to be attractive to the animal (i.e. \
failed to cause an approach). N=19.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A9-0-3 The masking of tones and tone complexes by noise in \
the auditory system of Hyla cinerea (green tree frog), and in Rana \
catesbeiana (bullfrog).", Bold, 12], 
               Style[
               "Hyla cinerea - green tree frog. 25 -55dB/Hz noise spectrum \
level (Ehret and Gerhardt, 1980) ", Italic, 12]}, Left, Spacings -> 1.5], 
             Background -> GrayLevel[0.85]], 
            Text[
            "Ehret, G. & Gerhardt, H.C. (1980)  Auditory masking and effects \
of noise on responses of the green treefrog (Hyla cinerea) to synthetic \
mating calls.  J. Comp. Physiol. 141, 13-18."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{6.802394763324311, 22.}, {8.006367567650246, 
                  21.5}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{6.802394763324311, 
                  22.}}, {{8.006367567650246, 21.5}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.05], 
                Scaled[0.05]}}, 
             AxesOrigin -> {6.758108003269355, 21.474999999999998`}, 
             PlotRange -> {{6.777311996567521, 8.006367567650246}, {21.5, 
              22.}}, PlotRangeClipping -> True, ImagePadding -> All, 
             DisplayFunction -> Identity, AspectRatio -> GoldenRatio^(-1), 
             Axes -> {True, True}, 
             AxesLabel -> {
              "Frequency [Hz]", "Signal-to-Noise Ratio at Threshold [dB]"}, 
             AxesOrigin -> {6.758108003269355, 21.474999999999998`}, 
             DisplayFunction :> Identity, 
             Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, Automatic}, {{{6.907755278982137, 1000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.313220387090301, 1500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.600902459542082, 2000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.824046010856292, 2500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 8.006367567650246, 3000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.214608098422191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.396929655216146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.551080335043404, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.684611727667927, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.802394763324311, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.003065458786462, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.090076835776092, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.170119543449628, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.24422751560335, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.3777589082278725`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.438383530044307, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.495541943884256, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.549609165154532, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.649692623711514, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.696212639346407, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.7406644019172415`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.783224016336037, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.8632667240095735`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.90100705199242, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.937374696163295, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.9724660159745655`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{6.777311996567521, 8.006367567650246}, {21.5, 
              22.}}, PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.05], 
                Scaled[0.05]}}, 
             Ticks -> {{{6.907755278982137, 1000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.313220387090301, 1500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.600902459542082, 2000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.824046010856292, 2500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                8.006367567650246, 3000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.214608098422191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.396929655216146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.551080335043404, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.684611727667927, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.802394763324311, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.003065458786462, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.090076835776092, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.170119543449628, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.24422751560335, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.3777589082278725`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.438383530044307, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.495541943884256, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.549609165154532, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.649692623711514, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.696212639346407, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.7406644019172415`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.783224016336037, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.8632667240095735`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.90100705199242, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.937374696163295, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.9724660159745655`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: These masked thresholds were determined using the \
unconditioned response of females to approach the source of sounds having \
some similarity to the male mating calls. Tones of fixed intensity were \
introduced against a continuous broad band noise background, and the noise \
level increased until the tone failed to be attractive to the animal (i.e. \
failed to cause an approach). N=19.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-4 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Rana catesbeiana - bullfrog. 4- 25 dB/Hz \
noise spectrum level (Megela Simmons, 1988a)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1988a)  Masking patterns \
in the bullfrog (Rana catesbeiana), I: Behavioral effects.  J. Acoust. Soc. \
Amer. in press.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1988a)  Masking patterns in the \
bullfrog (Rana catesbeiana), I: Behavioral effects.  J. Acoust. Soc. Amer. in \
press."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-4 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Rana catesbeiana - bullfrog. 4- 25 dB/Hz \
noise spectrum level (Megela Simmons, 1988a)\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1988a)  Masking patterns \
in the bullfrog (Rana catesbeiana), I: Behavioral effects.  J. Acoust. Soc. \
Amer. in press.\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1988a)  Masking patterns in the \
bullfrog (Rana catesbeiana), I: Behavioral effects.  J. Acoust. Soc. Amer. in \
press."]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
                    Hue[0.67, 0.6, 0.6], 
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    
                    LineBox[{{4.605170185988092, 29.}, {5.703782474656201, 
                    28.}, {6.396929655216146, 32.5}, {6.802394763324311, 
                    14.}, {7.090076835776092, 27.5}, {7.495541943884256, 
                    30.}, {8.006367567650246, 38.}}]}}, {{
                    Directive[
                    PointSize[0.012833333333333334`], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    AbsolutePointSize[6]], 
                    GeometricTransformationBox[
                    InsetBox[
                    BoxData[
                    FormBox[
                    StyleBox["\"*\"", 
                    GrayLevel[0], 12, StripOnInput -> False], 
                    TraditionalForm]], {0., 0.}], {{{4.605170185988092, 
                    29.}}, {{5.703782474656201, 28.}}, {{6.396929655216146, 
                    32.5}}, {{6.802394763324311, 14.}}, {{7.090076835776092, 
                    27.5}}, {{7.495541943884256, 30.}}, {{8.006367567650246, 
                    38.}}}]}, {}}}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {4.480061037508984, 0}, 
                  PlotRange -> {{4.534311907203465, 8.006367567650246}, {
                    0, 38.}}, PlotRangeClipping -> True, ImagePadding -> All, 
                  DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox[
                    "\"Signal-to-Noise Ratio at Threshold [dB]\"", 
                    TraditionalForm]}, AxesOrigin -> {4.480061037508984, 0}, 
                  DisplayFunction :> Identity, 
                  Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.912023005428146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.615805480084347, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.903487552536127, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{4.534311907203465, 8.006367567650246}, {
                    0, 38.}}, PlotRangeClipping -> True, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{4.605170185988092, 
                    FormBox["100", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.298317366548036, 
                    FormBox["200", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.214608098422191, 
                    FormBox["500", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.907755278982137, 
                    FormBox["1000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.600902459542082, 
                    FormBox["2000", TraditionalForm], {0.01, 0.}, {
                    AbsoluteThickness[0.1]}}, {3.912023005428146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.0943445622221, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.248495242049359, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.382026634673881, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {4.499809670330265, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.703782474656201, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {5.991464547107982, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.396929655216146, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.551080335043404, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.684611727667927, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {6.802394763324311, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {7.313220387090301, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.006367567650246, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.294049640102028, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.517193191416238, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.699514748210191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.85366542803745, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {8.987196820661973, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.104979856318357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.210340371976184, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.615805480084347, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {9.903487552536127, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: These thresholds were determined using the \
reflex inhibition technique used in Fig. A1-0 (see Notes) to determine \
audiograms in anurans. Flat spectrum noise was present continuously, and \
signals were tone bursts with 10 msec rise/fall times presented 200 msec \
preceding the shock (the reflex-eliciting stimulus). Method of constant \
stimuli. Threshold defined as a 10% reflex inhibition. The critical masking \
ratio is the difference (in dB) between the sound pressure level of the tone \
at threshold and the spectrum level (dB/Hz) of the masking noise. Masking \
noise continuous at 25 dB spectrum level. N=l.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A9-0-4 The masking of tones and tone complexes by noise in \
the auditory system of Hyla cinerea (green tree frog), and in Rana \
catesbeiana (bullfrog).", Bold, 12], 
               Style[
               "Rana catesbeiana - bullfrog. 4- 25 dB/Hz noise spectrum level \
(Megela Simmons, 1988a)", Italic, 12]}, Left, Spacings -> 1.5], Background -> 
             GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A. (1988a)  Masking patterns in the bullfrog \
(Rana catesbeiana), I: Behavioral effects.  J. Acoust. Soc. Amer. in \
press."]}], 
          Legended[
           Graphics[{{{}, {{{}, {}, {
                 Hue[0.67, 0.6, 0.6], 
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6]], 
                 
                 Line[{{4.605170185988092, 29.}, {5.703782474656201, 28.}, {
                  6.396929655216146, 32.5}, {6.802394763324311, 14.}, {
                  7.090076835776092, 27.5}, {7.495541943884256, 30.}, {
                  8.006367567650246, 38.}}]}}, {{
                 Directive[
                  PointSize[0.012833333333333334`], 
                  RGBColor[0.368417, 0.506779, 0.709798], 
                  AbsoluteThickness[1.6], 
                  AbsolutePointSize[6]], 
                 GeometricTransformation[
                  Inset[
                   Style["*", 
                    GrayLevel[0], 12], {0., 0.}], {{{4.605170185988092, 
                  29.}}, {{5.703782474656201, 28.}}, {{6.396929655216146, 
                  32.5}}, {{6.802394763324311, 14.}}, {{7.090076835776092, 
                  27.5}}, {{7.495541943884256, 30.}}, {{8.006367567650246, 
                  38.}}}]}, {}}}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {4.480061037508984, 0}, 
             PlotRange -> {{4.534311907203465, 8.006367567650246}, {0, 38.}}, 
             PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {
              "Frequency [Hz]", "Signal-to-Noise Ratio at Threshold [dB]"}, 
             AxesOrigin -> {4.480061037508984, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{
               Automatic, 
                Automatic}, {{{4.605170185988092, 100, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 5.298317366548036, 200, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.214608098422191, 500, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 6.907755278982137, 1000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {
                 7.600902459542082, 2000, {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {3.912023005428146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.0943445622221, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.248495242049359, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.382026634673881, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {4.499809670330265, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.703782474656201, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {5.991464547107982, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.396929655216146, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.551080335043404, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.684611727667927, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {6.802394763324311, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {7.313220387090301, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.006367567650246, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.294049640102028, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.517193191416238, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.699514748210191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.85366542803745, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {8.987196820661973, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.104979856318357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.210340371976184, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.615805480084347, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {9.903487552536127, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{4.534311907203465, 8.006367567650246}, {0, 38.}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, 
             Ticks -> {{{4.605170185988092, 100, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                5.298317366548036, 200, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.214608098422191, 500, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                6.907755278982137, 1000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {
                7.600902459542082, 2000, {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {3.912023005428146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.0943445622221, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.248495242049359, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.382026634673881, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {4.499809670330265, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.0106352940962555`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.703782474656201, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {5.991464547107982, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.396929655216146, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.551080335043404, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.684611727667927, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {6.802394763324311, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {7.313220387090301, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.006367567650246, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.294049640102028, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.517193191416238, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.699514748210191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.85366542803745, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {8.987196820661973, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.104979856318357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.210340371976184, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.615805480084347, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {9.903487552536127, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: These thresholds were determined using the reflex \
inhibition technique used in Fig. A1-0 (see Notes) to determine audiograms in \
anurans. Flat spectrum noise was present continuously, and signals were tone \
bursts with 10 msec rise/fall times presented 200 msec preceding the shock \
(the reflex-eliciting stimulus). Method of constant stimuli. Threshold \
defined as a 10% reflex inhibition. The critical masking ratio is the \
difference (in dB) between the sound pressure level of the tone at threshold \
and the spectrum level (dB/Hz) of the masking noise. Masking noise continuous \
at 25 dB spectrum level. N=l.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-5 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog (Megela \
Simmons, 1988b). Harmonic tone pair 1\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1988b)  Selectivity for \
harmonic structure for complex sounds by the green treefrog (Hyla cinerea)  \
J. Comp. Physiol. 162\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1988b)  Selectivity for harmonic \
structure for complex sounds by the green treefrog (Hyla cinerea)  J. Comp. \
Physiol. 162"]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-5 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog (Megela \
Simmons, 1988b). Harmonic tone pair 1\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1988b)  Selectivity for \
harmonic structure for complex sounds by the green treefrog (Hyla cinerea)  \
J. Comp. Physiol. 162\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1988b)  Selectivity for harmonic \
structure for complex sounds by the green treefrog (Hyla cinerea)  J. Comp. \
Physiol. 162"]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              
              TemplateBox[{
               GraphicsBox[{{{}, {}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {-0.036783854166666664`, 0},
                   PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
                  PlotRangeClipping -> True, ImagePadding -> All, 
                  DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox[
                    "\"Signal-to-Noise Ratio at Threshold [dB]\"", 
                    TraditionalForm]}, 
                  AxesOrigin -> {-0.036783854166666664`, 0}, DisplayFunction :> 
                  Identity, Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{0., 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.00\"", 1., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.25\"", 1.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.50\"", 1.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.75\"", 1.75, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.00\"", 2., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.25\"", 2.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.50\"", 2.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.371563556432483, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
                  PlotRangeClipping -> True, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{0., 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.00\"", 1., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.25\"", 1.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.50\"", 1.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.75\"", 1.75, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.00\"", 2., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.25\"", 2.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.50\"", 2.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.371563556432483, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: These thresholds were determined using the \
reflex inhibition technique used in Fig. A1-0 (see Notes) to determine \
audiograms in anurans. Flat spectrum noise was present continuously, and \
signals were tone bursts with 10 msec rise/fall times presented 200 msec \
preceding the shock (the reflex-eliciting stimulus). Method of constant \
stimuli. Threshold defined as a 10% reflex inhibition. The critical masking \
ratio is the difference (in dB) between the sound pressure level of the tone \
at threshold and the spectrum level (dB/Hz) of the masking noise. Broad band \
masker at 25 dB spectrum level. This result shows that harmonic complexes \
(characteristic of anuran vocalizations) are more efficiently detected in a \
noise background than inharmonic complexes. This is presumably due to central \
rather than peripheral processing.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A9-0-5 The masking of tones and tone complexes by noise in \
the auditory system of Hyla cinerea (green tree frog), and in Rana \
catesbeiana (bullfrog).", Bold, 12], 
               Style[
               "Hyla cinerea - green tree frog (Megela Simmons, 1988b). \
Harmonic tone pair 1", Italic, 12]}, Left, Spacings -> 1.5], Background -> 
             GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A. (1988b)  Selectivity for harmonic structure \
for complex sounds by the green treefrog (Hyla cinerea)  J. Comp. Physiol. \
162"]}], 
          Legended[
           
           Graphics[{{{}, {}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {-0.036783854166666664`, 0}, 
             PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
             PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {
              "Frequency [Hz]", "Signal-to-Noise Ratio at Threshold [dB]"}, 
             AxesOrigin -> {-0.036783854166666664`, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{Automatic, Automatic}, {{{0., 
                  NumberForm[1., {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                  NumberForm[1.25, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                  NumberForm[1.5, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                  NumberForm[1.75, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                  NumberForm[2., {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                  NumberForm[2.25, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                  NumberForm[2.5, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.371563556432483, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, Ticks -> {{{0., 
                 NumberForm[1., {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                 NumberForm[1.25, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                 NumberForm[1.5, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                 NumberForm[1.75, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                 NumberForm[2., {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                 NumberForm[2.25, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                 NumberForm[2.5, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.371563556432483, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: These thresholds were determined using the reflex \
inhibition technique used in Fig. A1-0 (see Notes) to determine audiograms in \
anurans. Flat spectrum noise was present continuously, and signals were tone \
bursts with 10 msec rise/fall times presented 200 msec preceding the shock \
(the reflex-eliciting stimulus). Method of constant stimuli. Threshold \
defined as a 10% reflex inhibition. The critical masking ratio is the \
difference (in dB) between the sound pressure level of the tone at threshold \
and the spectrum level (dB/Hz) of the masking noise. Broad band masker at 25 \
dB spectrum level. This result shows that harmonic complexes (characteristic \
of anuran vocalizations) are more efficiently detected in a noise background \
than inharmonic complexes. This is presumably due to central rather than \
peripheral processing.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-6 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog (Megela \
Simmons, 1988b). Harmonic tone pair 2\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1988b)  Selectivity for \
harmonic structure for complex sounds by the green treefrog (Hyla cinerea)  \
J. Comp. Physiol. 162\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1988b)  Selectivity for harmonic \
structure for complex sounds by the green treefrog (Hyla cinerea)  J. Comp. \
Physiol. 162"]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-6 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog (Megela \
Simmons, 1988b). Harmonic tone pair 2\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1988b)  Selectivity for \
harmonic structure for complex sounds by the green treefrog (Hyla cinerea)  \
J. Comp. Physiol. 162\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1988b)  Selectivity for harmonic \
structure for complex sounds by the green treefrog (Hyla cinerea)  J. Comp. \
Physiol. 162"]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              
              TemplateBox[{
               GraphicsBox[{{{}, {}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {-0.036783854166666664`, 0},
                   PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
                  PlotRangeClipping -> True, ImagePadding -> All, 
                  DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox[
                    "\"Signal-to-Noise Ratio at Threshold [dB]\"", 
                    TraditionalForm]}, 
                  AxesOrigin -> {-0.036783854166666664`, 0}, DisplayFunction :> 
                  Identity, Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{0., 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.00\"", 1., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.25\"", 1.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.50\"", 1.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.75\"", 1.75, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.00\"", 2., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.25\"", 2.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.50\"", 2.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.371563556432483, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
                  PlotRangeClipping -> True, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{0., 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.00\"", 1., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.25\"", 1.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.50\"", 1.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.75\"", 1.75, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.00\"", 2., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.25\"", 2.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.50\"", 2.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.371563556432483, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: These thresholds were determined using the \
reflex inhibition technique used in Fig. A1-0 (see Notes) to determine \
audiograms in anurans. Flat spectrum noise was present continuously, and \
signals were tone bursts with 10 msec rise/fall times presented 200 msec \
preceding the shock (the reflex-eliciting stimulus). Method of constant \
stimuli. Threshold defined as a 10% reflex inhibition. The critical masking \
ratio is the difference (in dB) between the sound pressure level of the tone \
at threshold and the spectrum level (dB/Hz) of the masking noise. Broad band \
masker at 25 dB spectrum level. This result shows that harmonic complexes \
(characteristic of anuran vocalizations) are more efficiently detected in a \
noise background than inharmonic complexes. This is presumably due to central \
rather than peripheral processing.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A9-0-6 The masking of tones and tone complexes by noise in \
the auditory system of Hyla cinerea (green tree frog), and in Rana \
catesbeiana (bullfrog).", Bold, 12], 
               Style[
               "Hyla cinerea - green tree frog (Megela Simmons, 1988b). \
Harmonic tone pair 2", Italic, 12]}, Left, Spacings -> 1.5], Background -> 
             GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A. (1988b)  Selectivity for harmonic structure \
for complex sounds by the green treefrog (Hyla cinerea)  J. Comp. Physiol. \
162"]}], 
          Legended[
           
           Graphics[{{{}, {}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {-0.036783854166666664`, 0}, 
             PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
             PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {
              "Frequency [Hz]", "Signal-to-Noise Ratio at Threshold [dB]"}, 
             AxesOrigin -> {-0.036783854166666664`, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{Automatic, Automatic}, {{{0., 
                  NumberForm[1., {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                  NumberForm[1.25, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                  NumberForm[1.5, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                  NumberForm[1.75, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                  NumberForm[2., {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                  NumberForm[2.25, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                  NumberForm[2.5, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.371563556432483, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, Ticks -> {{{0., 
                 NumberForm[1., {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                 NumberForm[1.25, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                 NumberForm[1.5, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                 NumberForm[1.75, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                 NumberForm[2., {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                 NumberForm[2.25, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                 NumberForm[2.5, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.371563556432483, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: These thresholds were determined using the reflex \
inhibition technique used in Fig. A1-0 (see Notes) to determine audiograms in \
anurans. Flat spectrum noise was present continuously, and signals were tone \
bursts with 10 msec rise/fall times presented 200 msec preceding the shock \
(the reflex-eliciting stimulus). Method of constant stimuli. Threshold \
defined as a 10% reflex inhibition. The critical masking ratio is the \
difference (in dB) between the sound pressure level of the tone at threshold \
and the spectrum level (dB/Hz) of the masking noise. Broad band masker at 25 \
dB spectrum level. This result shows that harmonic complexes (characteristic \
of anuran vocalizations) are more efficiently detected in a noise background \
than inharmonic complexes. This is presumably due to central rather than \
peripheral processing.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]},
    {
     TagBox[
      DynamicModuleBox[{Typeset`var$$ = False}, 
       InterpretationBox[
        StyleBox[
         PaneSelectorBox[{False->GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-7 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog (Megela \
Simmons, 1988b). Interharmonic tone pair\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1988b)  Selectivity for \
harmonic structure for complex sounds by the green treefrog (Hyla cinerea)  \
J. Comp. Physiol. 162\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1988b)  Selectivity for harmonic \
structure for complex sounds by the green treefrog (Hyla cinerea)  J. Comp. \
Physiol. 162"]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}], True->
          GridBox[{
            {
             OpenerBox[Dynamic[Typeset`var$$],
              Appearance->Automatic,
              AutoAction->False,
              ContinuousAction->False,
              Enabled->Automatic], 
             TagBox[GridBox[{
                {
                 PanelBox[
                  TagBox[GridBox[{
                    {
                    
                    StyleBox["\<\"A9-0-7 The masking of tones and tone \
complexes by noise in the auditory system of Hyla cinerea (green tree frog), \
and in Rana catesbeiana (bullfrog).\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontWeight->Bold]},
                    {
                    
                    StyleBox["\<\"Hyla cinerea - green tree frog (Megela \
Simmons, 1988b). Interharmonic tone pair\"\>",
                    StripOnInput->False,
                    FontSize->12,
                    FontSlant->Italic]}
                    },
                    DefaultBaseStyle->"Column",
                    GridBoxAlignment->{"Columns" -> {{Left}}},
                    
                    GridBoxItemSize->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
                    
                    GridBoxSpacings->{
                    "Columns" -> {{Automatic}}, "Rows" -> {{1.5}}}],
                   "Column"],
                  Background->GrayLevel[0.85]]},
                {
                 InterpretationBox[Cell[BoxData[
                   
                   FormBox["\<\"Megela Simmons, A. (1988b)  Selectivity for \
harmonic structure for complex sounds by the green treefrog (Hyla cinerea)  \
J. Comp. Physiol. 162\"\>", TextForm]], "InlineText"],
                  Text[
                  "Megela Simmons, A. (1988b)  Selectivity for harmonic \
structure for complex sounds by the green treefrog (Hyla cinerea)  J. Comp. \
Physiol. 162"]]}
               },
               DefaultBaseStyle->"Column",
               GridBoxAlignment->{"Columns" -> {{Left}}},
               
               GridBoxItemSize->{
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
              "Column"]},
            {"", 
             PaneBox[
              
              TemplateBox[{
               GraphicsBox[{{{}, {}, {}}}, {
                 DisplayFunction -> Identity, GridLines -> {None, None}, 
                  DisplayFunction -> Identity, DisplayFunction -> Identity, 
                  DisplayFunction -> Identity, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, AxesOrigin -> {-0.036783854166666664`, 0},
                   PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
                  PlotRangeClipping -> True, ImagePadding -> All, 
                  DisplayFunction -> Identity, AspectRatio -> 
                  NCache[GoldenRatio^(-1), 0.6180339887498948], 
                  Axes -> {True, True}, AxesLabel -> {
                    FormBox["\"Frequency [Hz]\"", TraditionalForm], 
                    FormBox[
                    "\"Signal-to-Noise Ratio at Threshold [dB]\"", 
                    TraditionalForm]}, 
                  AxesOrigin -> {-0.036783854166666664`, 0}, DisplayFunction :> 
                  Identity, Frame -> {{False, False}, {False, False}}, 
                  FrameLabel -> {{None, None}, {None, None}}, 
                  FrameTicks -> {{Automatic, Automatic}, {{{0., 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.00\"", 1., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.25\"", 1.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.50\"", 1.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.75\"", 1.75, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.00\"", 2., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.25\"", 2.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.50\"", 2.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.371563556432483, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}, 
                  GridLines -> {None, None}, GridLinesStyle -> Directive[
                    GrayLevel[0.5, 0.4]], ImageSize -> Large, 
                  Method -> {
                   "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                    (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                    (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
                  PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
                  PlotRangeClipping -> True, PlotRangePadding -> {{
                    Scaled[0.02], 
                    Scaled[0.02]}, {
                    Scaled[0.02], 
                    Scaled[0.05]}}, Ticks -> {{{0., 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.00\"", 1., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.25\"", 1.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.50\"", 1.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"1.75\"", 1.75, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.00\"", 2., AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.25\"", 2.25, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                    FormBox[
                    TagBox[
                    InterpretationBox["\"2.50\"", 2.5, AutoDelete -> True], 
                    NumberForm[#, {
                    DirectedInfinity[1], 2}]& ], TraditionalForm], {0.01, 
                    0.}, {
                    AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.371563556432483, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                    FormBox[
                    InterpretationBox[
                    StyleBox[
                    
                    GraphicsBox[{}, ImageSize -> {0, 0}, BaselinePosition -> 
                    Baseline], "CacheGraphics" -> False], 
                    Spacer[{0, 0}]], TraditionalForm], {0.005, 0.}, {
                    AbsoluteThickness[0.1]}}}, Automatic}}],FormBox[
                 FormBox[
                  PanelBox[
                   StyleBox[
                   "\"Notes: These thresholds were determined using the \
reflex inhibition technique used in Fig. A1-0 (see Notes) to determine \
audiograms in anurans. Flat spectrum noise was present continuously, and \
signals were tone bursts with 10 msec rise/fall times presented 200 msec \
preceding the shock (the reflex-eliciting stimulus). Method of constant \
stimuli. Threshold defined as a 10% reflex inhibition. The critical masking \
ratio is the difference (in dB) between the sound pressure level of the tone \
at threshold and the spectrum level (dB/Hz) of the masking noise. Broad band \
masker at 25 dB spectrum level. This result shows that harmonic complexes \
(characteristic of anuran vocalizations) are more efficiently detected in a \
noise background than inharmonic complexes. This is presumably due to central \
rather than peripheral processing.\"", 
                    GrayLevel[1], Bold, Italic, 12, StripOnInput -> False], 
                   Background -> RGBColor[0.2, 0.2, 0.2]], TraditionalForm], 
                 TraditionalForm]},
               "Legended",
               DisplayFunction->(GridBox[{{
                   TagBox[
                    ItemBox[
                    PaneBox[
                    TagBox[#, "SkipImageSizeLevel"], 
                    Alignment -> {Center, Baseline}, BaselinePosition -> 
                    Baseline], DefaultBaseStyle -> "Labeled"], 
                    "SkipImageSizeLevel"]}, {
                   ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {{Center}}, "Rows" -> {{Center}}}, AutoDelete -> 
                 False, GridBoxItemSize -> Automatic, 
                 BaselinePosition -> {1, 1}]& ),
               Editable->True,
               InterpretationFunction->(RowBox[{"Legended", "[", 
                  RowBox[{#, ",", 
                    RowBox[{"Placed", "[", 
                    RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )],
              ImageMargins->0]}
           },
           AutoDelete->False,
           BaselinePosition->{1, 1},
           GridBoxAlignment->{"Columns" -> {{Left}}},
           GridBoxBackground->{"Columns" -> {{Automatic}}},
           
           GridBoxItemSize->{
            "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
           GridBoxSpacings->{"Columns" -> {{0.2}}, "Rows" -> {{0.5}}}]}, 
          Dynamic[Typeset`var$$],
          Alignment->Automatic,
          BaselinePosition->Baseline,
          DefaultBaseStyle->"OpenerView",
          ImageMargins->0,
          ImageSize->Automatic],
         Deployed->False,
         StripOnInput->False],
        OpenerView[{
          Column[{
            Panel[
             Column[{
               Style[
               "A9-0-7 The masking of tones and tone complexes by noise in \
the auditory system of Hyla cinerea (green tree frog), and in Rana \
catesbeiana (bullfrog).", Bold, 12], 
               Style[
               "Hyla cinerea - green tree frog (Megela Simmons, 1988b). \
Interharmonic tone pair", Italic, 12]}, Left, Spacings -> 1.5], Background -> 
             GrayLevel[0.85]], 
            Text[
            "Megela Simmons, A. (1988b)  Selectivity for harmonic structure \
for complex sounds by the green treefrog (Hyla cinerea)  J. Comp. Physiol. \
162"]}], 
          Legended[
           
           Graphics[{{{}, {}, {}}}, {
            DisplayFunction -> Identity, GridLines -> {None, None}, 
             DisplayFunction -> Identity, DisplayFunction -> Identity, 
             DisplayFunction -> Identity, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, AxesOrigin -> {-0.036783854166666664`, 0}, 
             PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
             PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
             Identity, AspectRatio -> GoldenRatio^(-1), Axes -> {True, True}, 
             AxesLabel -> {
              "Frequency [Hz]", "Signal-to-Noise Ratio at Threshold [dB]"}, 
             AxesOrigin -> {-0.036783854166666664`, 0}, DisplayFunction :> 
             Identity, Frame -> {{False, False}, {False, False}}, 
             FrameLabel -> {{None, None}, {None, None}}, 
             FrameTicks -> {{Automatic, Automatic}, {{{0., 
                  NumberForm[1., {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                  NumberForm[1.25, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                  NumberForm[1.5, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                  NumberForm[1.75, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                  NumberForm[2., {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                  NumberForm[2.25, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                  NumberForm[2.5, {
                    DirectedInfinity[1], 2}], {0.01, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.371563556432483, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                  Spacer[{0, 0}], {0.005, 0.}, {
                   AbsoluteThickness[0.1]}}}, Automatic}}, 
             GridLines -> {None, None}, GridLinesStyle -> Directive[
               GrayLevel[0.5, 0.4]], ImageSize -> Large, 
             Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& ), "CopiedValueFunction" -> ({
                   (Part[{{Log, Exp}, {Identity, Identity}}, 1, 2][#]& )[
                    Part[#, 1]], 
                   (Part[{{Log, Exp}, {Identity, Identity}}, 2, 2][#]& )[
                    Part[#, 2]]}& )}}, 
             PlotRange -> {{-0.020833333333333336`, 1}, {0, 1}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {{
                Scaled[0.02], 
                Scaled[0.02]}, {
                Scaled[0.02], 
                Scaled[0.05]}}, Ticks -> {{{0., 
                 NumberForm[1., {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.22314355131420976`, 
                 NumberForm[1.25, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.4054651081081644, 
                 NumberForm[1.5, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5596157879354227, 
                 NumberForm[1.75, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6931471805599453, 
                 NumberForm[2., {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8109302162163288, 
                 NumberForm[2.25, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9162907318741551, 
                 NumberForm[2.5, {
                   DirectedInfinity[1], 2}], {0.01, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.04879016416943205, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.09531017980432493, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.13976194237515863`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.1823215567939546, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.26236426446749106`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.30010459245033816`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.3364722366212129, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.371563556432483, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.4382549309311553, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.47000362924573563`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5007752879124892, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5306282510621704, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.5877866649021191, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6151856390902335, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6418538861723947, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.6678293725756554, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7178397931503168, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7419373447293773, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7654678421395714, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.7884573603642703, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8329091229351039, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8544153281560676, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8754687373538999, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.8960880245566357, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9360933591703348, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9555114450274363, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9745596399981308, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {0.9932517730102834, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}, {1.0116009116784799`, 
                 Spacer[{0, 0}], {0.005, 0.}, {
                  AbsoluteThickness[0.1]}}}, Automatic}}], 
           Placed[
            Panel[
             Style[
             "Notes: These thresholds were determined using the reflex \
inhibition technique used in Fig. A1-0 (see Notes) to determine audiograms in \
anurans. Flat spectrum noise was present continuously, and signals were tone \
bursts with 10 msec rise/fall times presented 200 msec preceding the shock \
(the reflex-eliciting stimulus). Method of constant stimuli. Threshold \
defined as a 10% reflex inhibition. The critical masking ratio is the \
difference (in dB) between the sound pressure level of the tone at threshold \
and the spectrum level (dB/Hz) of the masking noise. Broad band masker at 25 \
dB spectrum level. This result shows that harmonic complexes (characteristic \
of anuran vocalizations) are more efficiently detected in a noise background \
than inharmonic complexes. This is presumably due to central rather than \
peripheral processing.", 
              GrayLevel[1], Bold, Italic, 12], Background -> 
             RGBColor[0.2, 0.2, 0.2]], Below]]}, False]],
       DynamicModuleValues:>{}],
      Setting[#, {0}]& ]}
   },
   DefaultBaseStyle->"Column",
   GridBoxAlignment->{"Columns" -> {{Left}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Column"]], "Output", "PluginEmbeddedContent"]
}, {2}]]
},
WindowSize->{1254, 2277},
Visible->True,
AuthoredSize->{1254, 2277},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
TrackCellChangeTimes->False,
FrontEndVersion->"10.4 for Linux x86 (64-bit) (February 25, 2016)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 8567, 205, 832, "Input"],
Cell[10056, 242, 622846, 12398, 1607, "Output"]
}, {2}]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature DW#f@ihw#1Um5WjZHPh6t1cd *)
