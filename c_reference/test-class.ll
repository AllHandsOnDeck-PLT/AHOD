; ModuleID = 'test-class.c'
source_filename = "test-class.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Player = type { i8*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"Bob\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Pointer is: (%s, %d)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Player, align 8 (* allocated on the stack for automatic variables *)
  store i32 0, i32* %1, align 4


  %3 = getelementptr inbounds %struct.Player, %struct.Player* %2, i32 0, i32 0 (*correspond to ln 12*)
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8** %3, align 8
  
  %4 = getelementptr inbounds %struct.Player, %struct.Player* %2, i32 0, i32 1 (*1: field 1 of the struct *)
  store i32 1, i32* %4, align 8
  
  %5 = getelementptr inbounds %struct.Player, %struct.Player* %2, i32 0, i32 0
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.Player, %struct.Player* %2, i32 0, i32 1
  %8 = load i32, i32* %7, align 8
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), i8* %6, i32 %8)
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}