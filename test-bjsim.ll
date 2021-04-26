; ModuleID = 'AHOD'
source_filename = "AHOD"

@str = global [4 x i8] c"%s\0A\00"
@str.1 = global [4 x i8] c"%d\0A\00"
@str.2 = global [4 x i8] c"%g\0A\00"
@str.3 = global [4 x i8] c"%d\0A\00"
@score = global i32 0
@i = global i32 0
@deck = global { i32*, { i8*, i1, i32 }* } zeroinitializer
@player = global { i8*, i32 } zeroinitializer
@str.4 = private unnamed_addr constant [26 x i8] c"That is a high value card\00"
@str.5 = private unnamed_addr constant [25 x i8] c"That is a low value card\00"
@str.30 = private unnamed_addr constant [8 x i8] c"Stephen\00"
@str.31 = private unnamed_addr constant [46 x i8] c"Hello, and welcome to our Blackjack Simulator\00"
@str.32 = private unnamed_addr constant [61 x i8] c"First things first let us welcome our player for the evening\00"
@str.33 = private unnamed_addr constant [3 x i8] c"R6\00"
@str.58 = private unnamed_addr constant [3 x i8] c"R5\00"
@str.59 = private unnamed_addr constant [3 x i8] c"R9\00"
@str.60 = private unnamed_addr constant [3 x i8] c"B9\00"
@str.61 = private unnamed_addr constant [3 x i8] c"B2\00"
@str.62 = private unnamed_addr constant [3 x i8] c"R3\00"
@str.87 = private unnamed_addr constant [45 x i8] c"There are 5 cards in the hand. A Hit Request\00"
@str.88 = private unnamed_addr constant [6 x i8] c"Card:\00"
@str.89 = private unnamed_addr constant [18 x i8] c"Current Score of:\00"
@str.90 = private unnamed_addr constant [20 x i8] c"Another hit request\00"
@str.91 = private unnamed_addr constant [6 x i8] c"Card:\00"
@str.92 = private unnamed_addr constant [18 x i8] c"Current Score of:\00"
@str.93 = private unnamed_addr constant [74 x i8] c"Looks like we stop here for tonight. Time to see what the next cards were\00"
@str.94 = private unnamed_addr constant [6 x i8] c"Card:\00"
@str.95 = private unnamed_addr constant [35 x i8] c"Could have had a higher score of: \00"
@str.96 = private unnamed_addr constant [60 x i8] c"Good that you stopped otherwise you would have a score of: \00"

declare i32 @printf(i8*, ...)

declare { i8*, i32 } @playercall(i8*, i32)

declare i8* @getplayername({ i8*, i32 })

declare i32 @getplayerscore({ i8*, i32 })

declare { i8*, i1, i32 } @cardcall(i8*, i1, i32)

declare i8* @getcardtype({ i8*, i1, i32 })

declare i1 @getcardfaceup({ i8*, i1, i32 })

declare i32 @getcardvalue({ i8*, i1, i32 })

define i8* @COMMENT(i32 %x) {
entry:
  %x1 = alloca i32
  store i32 %x, i32* %x1
  %localquip = alloca i8*
  %x2 = load i32, i32* %x1
  %tmp = icmp sgt i32 %x2, 6
  br i1 %tmp, label %then, label %else

merge:                                            ; preds = %else, %then
  %localquip3 = load i8*, i8** %localquip
  ret i8* %localquip3

then:                                             ; preds = %entry
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.4, i32 0, i32 0), i8** %localquip
  br label %merge

else:                                             ; preds = %entry
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.5, i32 0, i32 0), i8** %localquip
  br label %merge
}

define void @INIT() {
entry:
  %playercall = call { i8*, i32 } @playercall(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.30, i32 0, i32 0), i32 0)
  store { i8*, i32 } %playercall, { i8*, i32 }* @player
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @str.31, i32 0, i32 0))
  %printf1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @str.32, i32 0, i32 0))
  %player = load { i8*, i32 }, { i8*, i32 }* @player
  %getplayername = call i8* @getplayername({ i8*, i32 } %player)
  %printf2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getplayername)
  %new_series_ptr = alloca { i32*, { i8*, i1, i32 }* }
  %series_size_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %new_series_ptr, i32 0, i32 0
  %series_size = alloca i32
  store i32 0, i32* %series_size
  store i32* %series_size, i32** %series_size_ptr
  %series = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %new_series_ptr, i32 0, i32 1
  %p = alloca { i8*, i1, i32 }, i32 1028
  store { i8*, i1, i32 }* %p, { i8*, i1, i32 }** %series
  %cardcall = call { i8*, i1, i32 } @cardcall(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.33, i32 0, i32 0), i1 true, i32 6)
  call void @series_pushcard.10({ i32*, { i8*, i1, i32 }* }* %new_series_ptr, { i8*, i1, i32 } %cardcall)
  %new_series = load { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %new_series_ptr
  store { i32*, { i8*, i1, i32 }* } %new_series, { i32*, { i8*, i1, i32 }* }* @deck
  %deck = load { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* @deck
  %CREATEDECK_result = call { i32*, { i8*, i1, i32 }* } @CREATEDECK({ i32*, { i8*, i1, i32 }* } %deck)
  store { i32*, { i8*, i1, i32 }* } %CREATEDECK_result, { i32*, { i8*, i1, i32 }* }* @deck
  ret void
}

define { i32*, { i8*, i1, i32 }* } @CREATEDECK({ i32*, { i8*, i1, i32 }* } %deck) {
entry:
  %deck1 = alloca { i32*, { i8*, i1, i32 }* }
  %series_size_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %deck1, i32 0, i32 0
  %series_size = alloca i32
  store i32 0, i32* %series_size
  store i32* %series_size, i32** %series_size_ptr
  %series.arry = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %deck1, i32 0, i32 1
  %p = alloca { i8*, i1, i32 }, i32 1028
  store { i8*, i1, i32 }* %p, { i8*, i1, i32 }** %series.arry
  store { i32*, { i8*, i1, i32 }* } %deck, { i32*, { i8*, i1, i32 }* }* %deck1
  %types = alloca { i32*, i8** }
  %series_size_ptr2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %types, i32 0, i32 0
  %series_size3 = alloca i32
  store i32 0, i32* %series_size3
  store i32* %series_size3, i32** %series_size_ptr2
  %series.arry4 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %types, i32 0, i32 1
  %p5 = alloca i8*, i32 1028
  store i8** %p5, i8*** %series.arry4
  %values = alloca { i32*, i32* }
  %series_size_ptr6 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %values, i32 0, i32 0
  %series_size7 = alloca i32
  store i32 0, i32* %series_size7
  store i32* %series_size7, i32** %series_size_ptr6
  %series.arry8 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %values, i32 0, i32 1
  %p9 = alloca i32, i32 1028
  store i32* %p9, i32** %series.arry8
  %value = alloca i32
  %type = alloca i8*
  %card = alloca { i8*, i1, i32 }
  %new_series_ptr = alloca { i32*, i8** }
  %series_size_ptr10 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %new_series_ptr, i32 0, i32 0
  %series_size11 = alloca i32
  store i32 0, i32* %series_size11
  store i32* %series_size11, i32** %series_size_ptr10
  %series = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %new_series_ptr, i32 0, i32 1
  %p12 = alloca i8*, i32 1028
  store i8** %p12, i8*** %series
  call void @series_pushstr.37({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.58, i32 0, i32 0))
  call void @series_pushstr.37({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.59, i32 0, i32 0))
  call void @series_pushstr.37({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.60, i32 0, i32 0))
  call void @series_pushstr.37({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.61, i32 0, i32 0))
  call void @series_pushstr.37({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.62, i32 0, i32 0))
  %new_series = load { i32*, i8** }, { i32*, i8** }* %new_series_ptr
  store { i32*, i8** } %new_series, { i32*, i8** }* %types
  %new_series_ptr13 = alloca { i32*, i32* }
  %series_size_ptr14 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %new_series_ptr13, i32 0, i32 0
  %series_size15 = alloca i32
  store i32 0, i32* %series_size15
  store i32* %series_size15, i32** %series_size_ptr14
  %series16 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %new_series_ptr13, i32 0, i32 1
  %p17 = alloca i32, i32 1028
  store i32* %p17, i32** %series16
  call void @series_pushint.35({ i32*, i32* }* %new_series_ptr13, i32 3)
  call void @series_pushint.35({ i32*, i32* }* %new_series_ptr13, i32 9)
  call void @series_pushint.35({ i32*, i32* }* %new_series_ptr13, i32 9)
  call void @series_pushint.35({ i32*, i32* }* %new_series_ptr13, i32 2)
  call void @series_pushint.35({ i32*, i32* }* %new_series_ptr13, i32 3)
  %new_series18 = load { i32*, i32* }, { i32*, i32* }* %new_series_ptr13
  store { i32*, i32* } %new_series18, { i32*, i32* }* %values
  store i32 0, i32* @i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i25 = load i32, i32* @i
  %series_size26 = call i32 @series_sizestr.49({ i32*, i8** }* %types)
  %tmp27 = icmp slt i32 %i25, %series_size26
  br i1 %tmp27, label %while_body, label %merge

while_body:                                       ; preds = %while
  %i = load i32, i32* @i
  %series_get = call i8* @series_getstr.43({ i32*, i8** }* %types, i32 %i)
  store i8* %series_get, i8** %type
  %i19 = load i32, i32* @i
  %series_get20 = call i32 @series_getint.41({ i32*, i32* }* %values, i32 %i19)
  store i32 %series_get20, i32* %value
  %type21 = load i8*, i8** %type
  %value22 = load i32, i32* %value
  %cardcall = call { i8*, i1, i32 } @cardcall(i8* %type21, i1 true, i32 %value22)
  store { i8*, i1, i32 } %cardcall, { i8*, i1, i32 }* %card
  %card23 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  call void @series_pushcard.38({ i32*, { i8*, i1, i32 }* }* %deck1, { i8*, i1, i32 } %card23)
  %i24 = load i32, i32* @i
  %tmp = add i32 %i24, 1
  store i32 %tmp, i32* @i
  br label %while

merge:                                            ; preds = %while
  %deck28 = load { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %deck1
  ret { i32*, { i8*, i1, i32 }* } %deck28
}

define void @series_pushbool({ i32*, i1* }*, i1) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %val_alloc = alloca i1
  store i1 %1, i1* %val_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_load_2 = load i1*, i1** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i1, i1* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i1, i1* %val_alloc
  store i1 %val, i1* %series_next_el_ptr
  ret void
}

define void @series_pushint({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %val_alloc = alloca i32
  store i32 %1, i32* %val_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_load_2 = load i32*, i32** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i32, i32* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i32, i32* %val_alloc
  store i32 %val, i32* %series_next_el_ptr
  ret void
}

define void @series_pushfloat({ i32*, double* }*, double) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %val_alloc = alloca double
  store double %1, double* %val_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_load_2 = load double*, double** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr double, double* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load double, double* %val_alloc
  store double %val, double* %series_next_el_ptr
  ret void
}

define void @series_pushstr({ i32*, i8** }*, i8*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %val_alloc = alloca i8*
  store i8* %1, i8** %val_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_load_2 = load i8**, i8*** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i8*, i8** %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i8*, i8** %val_alloc
  store i8* %val, i8** %series_next_el_ptr
  ret void
}

define void @series_pushcard({ i32*, { i8*, i1, i32 }* }*, { i8*, i1, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i1, i32 }
  store { i8*, i1, i32 } %1, { i8*, i1, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i1, i32 }, { i8*, i1, i32 }* %val_alloc
  store { i8*, i1, i32 } %val, { i8*, i1, i32 }* %series_next_el_ptr
  ret void
}

define void @series_pushplayer({ i32*, { i8*, i32 }* }*, { i8*, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i32 }
  store { i8*, i32 } %1, { i8*, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i32 }, { i8*, i32 }* %val_alloc
  store { i8*, i32 } %val, { i8*, i32 }* %series_next_el_ptr
  ret void
}

define i1 @series_getbool({ i32*, i1* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %array_load = load i1*, i1** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i1, i1* %array_load, i32 %idx_load
  %series_el_ptr1 = load i1, i1* %series_el_ptr
  ret i1 %series_el_ptr1
}

define i32 @series_getint({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %array_load = load i32*, i32** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i32, i32* %array_load, i32 %idx_load
  %series_el_ptr1 = load i32, i32* %series_el_ptr
  ret i32 %series_el_ptr1
}

define double @series_getfloat({ i32*, double* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %array_load = load double*, double** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr double, double* %array_load, i32 %idx_load
  %series_el_ptr1 = load double, double* %series_el_ptr
  ret double %series_el_ptr1
}

define i8* @series_getstr({ i32*, i8** }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %array_load = load i8**, i8*** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i8*, i8** %array_load, i32 %idx_load
  %series_el_ptr1 = load i8*, i8** %series_el_ptr
  ret i8* %series_el_ptr1
}

define { i8*, i1, i32 } @series_getcard({ i32*, { i8*, i1, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_el_ptr
  ret { i8*, i1, i32 } %series_el_ptr1
}

define { i8*, i32 } @series_getplayer({ i32*, { i8*, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i32 }, { i8*, i32 }* %series_el_ptr
  ret { i8*, i32 } %series_el_ptr1
}

define i32 @series_sizebool({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeint({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizefloat({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizestr({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizecard({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeplayer({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i1 @series_popbool({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_arr_load = load i1*, i1** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i1, i1* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i1, i1* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i1 %series_arry_next_element
}

define i32 @series_popint({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_arr_load = load i32*, i32** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i32, i32* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i32, i32* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i32 %series_arry_next_element
}

define double @series_popfloat({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_arr_load = load double*, double** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr double, double* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load double, double* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret double %series_arry_next_element
}

define i8* @series_popstr({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_arr_load = load i8**, i8*** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i8*, i8** %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i8*, i8** %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i8* %series_arry_next_element
}

define { i8*, i1, i32 } @series_popcard({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i1, i32 } %series_arry_next_element
}

define { i8*, i32 } @series_popplayer({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i32 }*, { i8*, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i32 }, { i8*, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i32 } %series_arry_next_element
}

define void @series_pushbool.6({ i32*, i1* }*, i1) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %val_alloc = alloca i1
  store i1 %1, i1* %val_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_load_2 = load i1*, i1** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i1, i1* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i1, i1* %val_alloc
  store i1 %val, i1* %series_next_el_ptr
  ret void
}

define void @series_pushint.7({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %val_alloc = alloca i32
  store i32 %1, i32* %val_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_load_2 = load i32*, i32** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i32, i32* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i32, i32* %val_alloc
  store i32 %val, i32* %series_next_el_ptr
  ret void
}

define void @series_pushfloat.8({ i32*, double* }*, double) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %val_alloc = alloca double
  store double %1, double* %val_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_load_2 = load double*, double** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr double, double* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load double, double* %val_alloc
  store double %val, double* %series_next_el_ptr
  ret void
}

define void @series_pushstr.9({ i32*, i8** }*, i8*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %val_alloc = alloca i8*
  store i8* %1, i8** %val_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_load_2 = load i8**, i8*** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i8*, i8** %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i8*, i8** %val_alloc
  store i8* %val, i8** %series_next_el_ptr
  ret void
}

define void @series_pushcard.10({ i32*, { i8*, i1, i32 }* }*, { i8*, i1, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i1, i32 }
  store { i8*, i1, i32 } %1, { i8*, i1, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i1, i32 }, { i8*, i1, i32 }* %val_alloc
  store { i8*, i1, i32 } %val, { i8*, i1, i32 }* %series_next_el_ptr
  ret void
}

define void @series_pushplayer.11({ i32*, { i8*, i32 }* }*, { i8*, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i32 }
  store { i8*, i32 } %1, { i8*, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i32 }, { i8*, i32 }* %val_alloc
  store { i8*, i32 } %val, { i8*, i32 }* %series_next_el_ptr
  ret void
}

define i1 @series_getbool.12({ i32*, i1* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %array_load = load i1*, i1** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i1, i1* %array_load, i32 %idx_load
  %series_el_ptr1 = load i1, i1* %series_el_ptr
  ret i1 %series_el_ptr1
}

define i32 @series_getint.13({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %array_load = load i32*, i32** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i32, i32* %array_load, i32 %idx_load
  %series_el_ptr1 = load i32, i32* %series_el_ptr
  ret i32 %series_el_ptr1
}

define double @series_getfloat.14({ i32*, double* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %array_load = load double*, double** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr double, double* %array_load, i32 %idx_load
  %series_el_ptr1 = load double, double* %series_el_ptr
  ret double %series_el_ptr1
}

define i8* @series_getstr.15({ i32*, i8** }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %array_load = load i8**, i8*** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i8*, i8** %array_load, i32 %idx_load
  %series_el_ptr1 = load i8*, i8** %series_el_ptr
  ret i8* %series_el_ptr1
}

define { i8*, i1, i32 } @series_getcard.16({ i32*, { i8*, i1, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_el_ptr
  ret { i8*, i1, i32 } %series_el_ptr1
}

define { i8*, i32 } @series_getplayer.17({ i32*, { i8*, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i32 }, { i8*, i32 }* %series_el_ptr
  ret { i8*, i32 } %series_el_ptr1
}

define i32 @series_sizebool.18({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeint.19({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizefloat.20({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizestr.21({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizecard.22({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeplayer.23({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i1 @series_popbool.24({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_arr_load = load i1*, i1** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i1, i1* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i1, i1* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i1 %series_arry_next_element
}

define i32 @series_popint.25({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_arr_load = load i32*, i32** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i32, i32* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i32, i32* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i32 %series_arry_next_element
}

define double @series_popfloat.26({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_arr_load = load double*, double** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr double, double* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load double, double* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret double %series_arry_next_element
}

define i8* @series_popstr.27({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_arr_load = load i8**, i8*** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i8*, i8** %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i8*, i8** %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i8* %series_arry_next_element
}

define { i8*, i1, i32 } @series_popcard.28({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i1, i32 } %series_arry_next_element
}

define { i8*, i32 } @series_popplayer.29({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i32 }*, { i8*, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i32 }, { i8*, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i32 } %series_arry_next_element
}

define void @series_pushbool.34({ i32*, i1* }*, i1) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %val_alloc = alloca i1
  store i1 %1, i1* %val_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_load_2 = load i1*, i1** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i1, i1* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i1, i1* %val_alloc
  store i1 %val, i1* %series_next_el_ptr
  ret void
}

define void @series_pushint.35({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %val_alloc = alloca i32
  store i32 %1, i32* %val_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_load_2 = load i32*, i32** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i32, i32* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i32, i32* %val_alloc
  store i32 %val, i32* %series_next_el_ptr
  ret void
}

define void @series_pushfloat.36({ i32*, double* }*, double) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %val_alloc = alloca double
  store double %1, double* %val_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_load_2 = load double*, double** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr double, double* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load double, double* %val_alloc
  store double %val, double* %series_next_el_ptr
  ret void
}

define void @series_pushstr.37({ i32*, i8** }*, i8*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %val_alloc = alloca i8*
  store i8* %1, i8** %val_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_load_2 = load i8**, i8*** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i8*, i8** %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i8*, i8** %val_alloc
  store i8* %val, i8** %series_next_el_ptr
  ret void
}

define void @series_pushcard.38({ i32*, { i8*, i1, i32 }* }*, { i8*, i1, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i1, i32 }
  store { i8*, i1, i32 } %1, { i8*, i1, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i1, i32 }, { i8*, i1, i32 }* %val_alloc
  store { i8*, i1, i32 } %val, { i8*, i1, i32 }* %series_next_el_ptr
  ret void
}

define void @series_pushplayer.39({ i32*, { i8*, i32 }* }*, { i8*, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i32 }
  store { i8*, i32 } %1, { i8*, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i32 }, { i8*, i32 }* %val_alloc
  store { i8*, i32 } %val, { i8*, i32 }* %series_next_el_ptr
  ret void
}

define i1 @series_getbool.40({ i32*, i1* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %array_load = load i1*, i1** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i1, i1* %array_load, i32 %idx_load
  %series_el_ptr1 = load i1, i1* %series_el_ptr
  ret i1 %series_el_ptr1
}

define i32 @series_getint.41({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %array_load = load i32*, i32** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i32, i32* %array_load, i32 %idx_load
  %series_el_ptr1 = load i32, i32* %series_el_ptr
  ret i32 %series_el_ptr1
}

define double @series_getfloat.42({ i32*, double* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %array_load = load double*, double** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr double, double* %array_load, i32 %idx_load
  %series_el_ptr1 = load double, double* %series_el_ptr
  ret double %series_el_ptr1
}

define i8* @series_getstr.43({ i32*, i8** }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %array_load = load i8**, i8*** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i8*, i8** %array_load, i32 %idx_load
  %series_el_ptr1 = load i8*, i8** %series_el_ptr
  ret i8* %series_el_ptr1
}

define { i8*, i1, i32 } @series_getcard.44({ i32*, { i8*, i1, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_el_ptr
  ret { i8*, i1, i32 } %series_el_ptr1
}

define { i8*, i32 } @series_getplayer.45({ i32*, { i8*, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i32 }, { i8*, i32 }* %series_el_ptr
  ret { i8*, i32 } %series_el_ptr1
}

define i32 @series_sizebool.46({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeint.47({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizefloat.48({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizestr.49({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizecard.50({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeplayer.51({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i1 @series_popbool.52({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_arr_load = load i1*, i1** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i1, i1* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i1, i1* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i1 %series_arry_next_element
}

define i32 @series_popint.53({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_arr_load = load i32*, i32** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i32, i32* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i32, i32* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i32 %series_arry_next_element
}

define double @series_popfloat.54({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_arr_load = load double*, double** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr double, double* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load double, double* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret double %series_arry_next_element
}

define i8* @series_popstr.55({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_arr_load = load i8**, i8*** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i8*, i8** %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i8*, i8** %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i8* %series_arry_next_element
}

define { i8*, i1, i32 } @series_popcard.56({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i1, i32 } %series_arry_next_element
}

define { i8*, i32 } @series_popplayer.57({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i32 }*, { i8*, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i32 }, { i8*, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i32 } %series_arry_next_element
}

define i32 @main() {
entry:
  %quip = alloca i8*
  %currvalue = alloca i32
  %card = alloca { i8*, i1, i32 }
  call void @INIT()
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @str.87, i32 0, i32 0))
  %series_size = call i32 @series_sizecard.79({ i32*, { i8*, i1, i32 }* }* @deck)
  %tmp = sub i32 %series_size, 1
  %series_get = call { i8*, i1, i32 } @series_getcard.73({ i32*, { i8*, i1, i32 }* }* @deck, i32 %tmp)
  store { i8*, i1, i32 } %series_get, { i8*, i1, i32 }* %card
  store i32 0, i32* @score
  %printf1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.88, i32 0, i32 0))
  %card2 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardtype = call i8* @getcardtype({ i8*, i1, i32 } %card2)
  %printf3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getcardtype)
  %printf4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.89, i32 0, i32 0))
  %score = load i32, i32* @score
  %card5 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardvalue = call i32 @getcardvalue({ i8*, i1, i32 } %card5)
  %tmp6 = add i32 %score, %getcardvalue
  store i32 %tmp6, i32* @score
  %score7 = load i32, i32* @score
  %printf8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.1, i32 0, i32 0), i32 %score7)
  %series_pop = call { i8*, i1, i32 } @series_popcard.85({ i32*, { i8*, i1, i32 }* }* @deck)
  %printf9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @str.90, i32 0, i32 0))
  %series_size10 = call i32 @series_sizecard.79({ i32*, { i8*, i1, i32 }* }* @deck)
  %tmp11 = sub i32 %series_size10, 1
  %series_get12 = call { i8*, i1, i32 } @series_getcard.73({ i32*, { i8*, i1, i32 }* }* @deck, i32 %tmp11)
  store { i8*, i1, i32 } %series_get12, { i8*, i1, i32 }* %card
  %printf13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.91, i32 0, i32 0))
  %card14 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardtype15 = call i8* @getcardtype({ i8*, i1, i32 } %card14)
  %printf16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getcardtype15)
  %printf17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.92, i32 0, i32 0))
  %score18 = load i32, i32* @score
  %card19 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardvalue20 = call i32 @getcardvalue({ i8*, i1, i32 } %card19)
  %tmp21 = add i32 %score18, %getcardvalue20
  store i32 %tmp21, i32* @score
  %score22 = load i32, i32* @score
  %printf23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.1, i32 0, i32 0), i32 %score22)
  %series_pop24 = call { i8*, i1, i32 } @series_popcard.85({ i32*, { i8*, i1, i32 }* }* @deck)
  %printf25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8], [74 x i8]* @str.93, i32 0, i32 0))
  store i32 0, i32* @i
  br label %while

while:                                            ; preds = %merge, %entry
  %i48 = load i32, i32* @i
  %series_size49 = call i32 @series_sizecard.79({ i32*, { i8*, i1, i32 }* }* @deck)
  %tmp50 = icmp slt i32 %i48, %series_size49
  br i1 %tmp50, label %while_body, label %merge51

while_body:                                       ; preds = %while
  %i = load i32, i32* @i
  %series_get26 = call { i8*, i1, i32 } @series_getcard.73({ i32*, { i8*, i1, i32 }* }* @deck, i32 %i)
  store { i8*, i1, i32 } %series_get26, { i8*, i1, i32 }* %card
  %printf27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.94, i32 0, i32 0))
  %card28 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardtype29 = call i8* @getcardtype({ i8*, i1, i32 } %card28)
  %printf30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getcardtype29)
  %score31 = load i32, i32* @score
  %card32 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardvalue33 = call i32 @getcardvalue({ i8*, i1, i32 } %card32)
  %tmp34 = add i32 %score31, %getcardvalue33
  store i32 %tmp34, i32* @score
  %score35 = load i32, i32* @score
  %COMMENT_result = call i8* @COMMENT(i32 %score35)
  store i8* %COMMENT_result, i8** %quip
  %quip36 = load i8*, i8** %quip
  %printf37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %quip36)
  %score38 = load i32, i32* @score
  %tmp39 = icmp slt i32 %score38, 21
  br i1 %tmp39, label %then, label %else

merge:                                            ; preds = %else, %then
  %i46 = load i32, i32* @i
  %tmp47 = add i32 %i46, 1
  store i32 %tmp47, i32* @i
  br label %while

then:                                             ; preds = %while_body
  %printf40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @str.95, i32 0, i32 0))
  %score41 = load i32, i32* @score
  %printf42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.1, i32 0, i32 0), i32 %score41)
  br label %merge

else:                                             ; preds = %while_body
  %printf43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @str.96, i32 0, i32 0))
  %score44 = load i32, i32* @score
  %printf45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.1, i32 0, i32 0), i32 %score44)
  br label %merge

merge51:                                          ; preds = %while
  ret i32 0
}

define void @series_pushbool.63({ i32*, i1* }*, i1) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %val_alloc = alloca i1
  store i1 %1, i1* %val_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_load_2 = load i1*, i1** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i1, i1* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i1, i1* %val_alloc
  store i1 %val, i1* %series_next_el_ptr
  ret void
}

define void @series_pushint.64({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %val_alloc = alloca i32
  store i32 %1, i32* %val_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_load_2 = load i32*, i32** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i32, i32* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i32, i32* %val_alloc
  store i32 %val, i32* %series_next_el_ptr
  ret void
}

define void @series_pushfloat.65({ i32*, double* }*, double) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %val_alloc = alloca double
  store double %1, double* %val_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_load_2 = load double*, double** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr double, double* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load double, double* %val_alloc
  store double %val, double* %series_next_el_ptr
  ret void
}

define void @series_pushstr.66({ i32*, i8** }*, i8*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %val_alloc = alloca i8*
  store i8* %1, i8** %val_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_load_2 = load i8**, i8*** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i8*, i8** %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i8*, i8** %val_alloc
  store i8* %val, i8** %series_next_el_ptr
  ret void
}

define void @series_pushcard.67({ i32*, { i8*, i1, i32 }* }*, { i8*, i1, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i1, i32 }
  store { i8*, i1, i32 } %1, { i8*, i1, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i1, i32 }, { i8*, i1, i32 }* %val_alloc
  store { i8*, i1, i32 } %val, { i8*, i1, i32 }* %series_next_el_ptr
  ret void
}

define void @series_pushplayer.68({ i32*, { i8*, i32 }* }*, { i8*, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i32 }
  store { i8*, i32 } %1, { i8*, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i32 }, { i8*, i32 }* %val_alloc
  store { i8*, i32 } %val, { i8*, i32 }* %series_next_el_ptr
  ret void
}

define i1 @series_getbool.69({ i32*, i1* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %array_load = load i1*, i1** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i1, i1* %array_load, i32 %idx_load
  %series_el_ptr1 = load i1, i1* %series_el_ptr
  ret i1 %series_el_ptr1
}

define i32 @series_getint.70({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %array_load = load i32*, i32** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i32, i32* %array_load, i32 %idx_load
  %series_el_ptr1 = load i32, i32* %series_el_ptr
  ret i32 %series_el_ptr1
}

define double @series_getfloat.71({ i32*, double* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %array_load = load double*, double** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr double, double* %array_load, i32 %idx_load
  %series_el_ptr1 = load double, double* %series_el_ptr
  ret double %series_el_ptr1
}

define i8* @series_getstr.72({ i32*, i8** }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %array_load = load i8**, i8*** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i8*, i8** %array_load, i32 %idx_load
  %series_el_ptr1 = load i8*, i8** %series_el_ptr
  ret i8* %series_el_ptr1
}

define { i8*, i1, i32 } @series_getcard.73({ i32*, { i8*, i1, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_el_ptr
  ret { i8*, i1, i32 } %series_el_ptr1
}

define { i8*, i32 } @series_getplayer.74({ i32*, { i8*, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i32 }, { i8*, i32 }* %series_el_ptr
  ret { i8*, i32 } %series_el_ptr1
}

define i32 @series_sizebool.75({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeint.76({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizefloat.77({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizestr.78({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizecard.79({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeplayer.80({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i1 @series_popbool.81({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_arr_load = load i1*, i1** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i1, i1* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i1, i1* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i1 %series_arry_next_element
}

define i32 @series_popint.82({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_arr_load = load i32*, i32** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i32, i32* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i32, i32* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i32 %series_arry_next_element
}

define double @series_popfloat.83({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_arr_load = load double*, double** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr double, double* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load double, double* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret double %series_arry_next_element
}

define i8* @series_popstr.84({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_arr_load = load i8**, i8*** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i8*, i8** %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i8*, i8** %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i8* %series_arry_next_element
}

define { i8*, i1, i32 } @series_popcard.85({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i1, i32 } %series_arry_next_element
}

define { i8*, i32 } @series_popplayer.86({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i32 }*, { i8*, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i32 }, { i8*, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i32 } %series_arry_next_element
}
