; ModuleID = 'playercall.c'
source_filename = "playercall.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"

%struct.Player = type { i8*, i32 }
; Function Attrs: noinline nounwind optnone ssp uwtable
define %struct.Player* @playercall(i8* %0, i32 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.Player*, align 8
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = call i8* @malloc(i64 16) #2
  %7 = bitcast i8* %6 to %struct.Player*
  store %struct.Player* %7, %struct.Player** %5, align 8
  %8 = load i8*, i8** %3, align 8
  %9 = load %struct.Player*, %struct.Player** %5, align 8
  %10 = getelementptr inbounds %struct.Player, %struct.Player* %9, i32 0, i32 0
  store i8* %8, i8** %10, align 8
  %11 = load i32, i32* %4, align 4
  %12 = load %struct.Player*, %struct.Player** %5, align 8
  %13 = getelementptr inbounds %struct.Player, %struct.Player* %12, i32 0, i32 1
  store i32 %11, i32* %13, align 8
  %14 = load %struct.Player*, %struct.Player** %5, align 8
  ret %struct.Player* %14
}
; Function Attrs: allocsize(0)
declare i8* @malloc(i64) #1
; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @getplayername(%struct.Player* %0) #0 {
  %2 = alloca %struct.Player*, align 8
  store %struct.Player* %0, %struct.Player** %2, align 8
  %3 = load %struct.Player*, %struct.Player** %2, align 8
  %4 = getelementptr inbounds %struct.Player, %struct.Player* %3, i32 0, i32 0
  %5 = load i8*, i8** %4, align 8
  ret i8* %5
}
; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @getplayerscore(%struct.Player* %0) #0 {
  %2 = alloca %struct.Player*, align 8
  store %struct.Player* %0, %struct.Player** %2, align 8
  %3 = load %struct.Player*, %struct.Player** %2, align 8
  %4 = getelementptr inbounds %struct.Player, %struct.Player* %3, i32 0, i32 1
  %5 = load i32, i32* %4, align 8
  ret i32 %5
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [3 x i32] [i32 10, i32 15, i32 6]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Apple clang version 12.0.0 (clang-1200.0.32.2)"}
