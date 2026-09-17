
" Vim syntax file
" Language: ASL (ACPI source language)
" Author: Mika Westerberg

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = "asl"
endif

syn case ignore

syn match aslLineComment "\/\/.*"
syn region aslComment start="/\*" end="\*/"

syn region aslString start=+"+ skip=+\\\\\|\\"+ end=+"\|$+

syn match aslNumber "\<[0-9_]\+\>"
syn match aslNumber "\<0x[0-9a-fA-F_]\+\>"

syn match aslVariables "\<Arg[0-9]\>"
syn match aslVariables "\<Local[0-9]\>"

syn keyword aslOperators AccessAs Acquire Add Alias And BankField Break BreakPoint Buffer
syn keyword aslOperators Case Concatenate ConcatenateResTemplate CondRefOf Connection Continue
syn keyword aslOperators CopyObject CreateBitField CreateByteField CreateDWordField CreateField
syn keyword aslOperators CreateQWordField CreateWordField DataTableRegion Debug Decrement Default
syn keyword aslOperators DefinitionBlock DeRefOf Device Divide Eisaid Else ElseIf Event Fatal Field
syn keyword asloperators FindSetLeftBit FindSetRightBit FromBcd Function If Increment Index IndexField
syn keyword aslOperators LAnd LEqual LGreater LGreaterEqual LLess LLessEqual LNot LNotEqual Load LoadTable
syn keyword aslOperators LOr Match Method Mid Mod Multiply Mutex Name NAnd Noop NOr Not Notify ObjectType
syn keyword aslOperators Offset One Ones OperationRegion Or Package PowerResource Processor RefOf Release
syn keyword aslOperators Reset Return Revision Scope ShiftLeft ShiftRight Signal SizeOf Sleep Stall Store
syn keyword aslOperators Subtract Switch ThermalZone Timer ToBcd ToBuffer ToDecimalString ToHexString
syn keyword aslOperators ToInteger ToString ToUuid Unicode Unload Wait While XOr Zero

syn keyword aslOperators External

syn keyword aslResources ResourceTemplate RawDataBuffer DMA DWordIO DWordMemory DWordSpace EndDependentFn
syn keyword aslResources ExtendedIO ExtendedMemory ExtendedSpace FixedDma FixedIO GpioInt GpioIo I2cSerialBus
syn keyword aslResources I2cSerialBusV2 Interrupt IO IRQ IRQNoFlags Memory24 Memory32 Memory32Fixed
syn keyword aslResources QWordIO QWordMemory QWordSpace Register SpiSerialBus SpiSerialBusV2
syn keyword aslResources StartDependentFn StartDependentFnNoPri UartSerialBus UartSerialBusV2 VendorLong
syn keyword aslResources VendorShort WordBusNumber WordIO WordSpace

syn keyword aslKeywords AttribQuick AttribSendReceive AttribByte AttribBytes AttribRawBytes AttribRawProcessBytes AttribWord AttribBlock AttribProcessCall AttribBlockProcessCall
syn keyword aslKeywords AnyAcc ByteAcc WordAcc DWordAcc QWordAcc BufferAcc
syn keyword aslKeywords AddressRangeMemory AddressRangeReserved AddressRangeNVS AddressRangeACPI
syn keyword aslKeywords RegionSpaceKeyword FFixedHW
syn keyword aslKeywords AddressingMode7Bit AddressingMode10Bit
syn keyword aslKeywords DataBitsFive DataBitsSix DataBitsSeven DataBitsEight DataBitsNine
syn keyword aslKeywords BusMaster NotBusMaster
syn keyword aslKeywords ClockPhaseFirst ClockPhaseSecond
syn keyword aslKeywords ClockPolarityLow ClockPolarityHigh
syn keyword aslKeywords SubDecode PosDecode
syn keyword aslKeywords BigEndianing LittleEndian
syn keyword aslKeywords AttribBytes AttribRawBytes AttribRawProcessBytes
syn keyword aslKeywords FlowControlNone FlowControlXon FlowControlHardware
syn keyword aslKeywords Edge Level
syn keyword aslKeywords ActiveHigh ActiveLow ActiveBoth
syn keyword aslKeywords Decode16 Decode10
syn keyword aslKeywords IoRestrictionNone IoRestrictionInputOnly IoRestrictionOutputOnly IoRestrictionNoneAndPreserve
syn keyword aslKeywords Lock NoLock
syn keyword aslKeywords MTR MEQ MLE MLT MGE MGT
syn keyword aslKeywords MaxFixed MaxNotFixed
syn keyword aslKeywords Cacheable WriteCombining Prefetchable NonCacheable
syn keyword aslKeywords MinFixed MinNotFixed
syn keyword aslKeywords UnknownObj IntObj StrObj BuffObj PkgObj FieldUnitObj DeviceObj EventObj MethodObj MutexObj OpRegionObj PowerResObj ProcessorObj ThermalZoneObj BuffFieldObj DDBHandleObj
syn keyword aslKeywords ParityTypeNone ParityTypeSpace ParityTypeMark ParityTypeOdd ParityTypeEven
syn keyword aslKeywords PullDefault PullUp PullDown PullNone
syn keyword aslKeywords PolarityHigh PolarityLow
syn keyword aslKeywords ISAOnlyRanges NonISAOnlyRanges EntireRange
syn keyword aslKeywords ReadWrite ReadOnly
syn keyword aslKeywords SystemIO SystemMemory PCI_Config EmbeddedControl SMBus SystemCMOS PciBarTarget IPMI GeneralPurposeIO GenericSerialBus PCC
syn keyword aslKeywords ResourceConsumer ResourceProducer
syn keyword aslKeywords Serialized NotSerialized
syn keyword aslKeywords Shared Exclusive SharedAndWake ExclusiveAndWake
syn keyword aslKeywords ControllerInitiated DeviceInitiated
syn keyword aslKeywords StopBitsZero StopBitsOne StopBitsOnePlusHalf StopBitsTwo
syn keyword aslKeywords Width8Bit Width16Bit Width32Bit Width64Bit Width128Bit Width256Bit
syn keyword aslKeywords SparseTranslation DenseTranslation
syn keyword aslKeywords TypeTranslation TypeStatic
syn keyword aslKeywords Preserve WriteAsOnes WriteAsZeros
syn keyword aslKeywords Transfer8 Transfer16 Transfer8_16
syn keyword aslKeywords ThreeWireMode FourWireMode

syn keyword aslIncludes Include

hi link aslLineComment Comment
hi link aslComment Comment
hi link aslString String
hi link aslNumber Number
hi link aslVariables Identifier
hi link aslOperators Keyword
hi link aslResources Type
hi link aslIncludes Include
hi aslKeywords guifg=#f9e2af ctermfg=222

" iASL specifics
syn region iaslInclude start="^\s*\(%:\|#\)\s*include\>\s*["<]" end="$"
syn region iaslDefine start="^\s*\(%:\|#\)\s*\(if\|ifdef\|else\|define\|undef\|endif\)\>" skip="\\$" end="$"
hi link iaslInclude Include
hi link iaslDefine Define

let b:current_syntax = "asl"
if main_syntax == 'asl'
  unlet main_syntax
endif

