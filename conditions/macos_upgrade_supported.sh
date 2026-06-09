#!/bin/bash


script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$script_dir/lib/util.sh"


goldengate_upgrade_supported() {
    if [[ $( macos_major ) -ge 27 ]]; then
        echo "false"
        return
    fi
    if is_virtual; then
        echo "true"
        return
    fi

    case $( hw_target ) in
    J180dAP | \
    J274AP | \
    J293AP | \
    J313AP | \
    J314cAP | \
    J314sAP | \
    J316cAP | \
    J316sAP | \
    J375cAP | \
    J375dAP | \
    J413AP | \
    J414cAP | \
    J414sAP | \
    J415AP | \
    J416cAP | \
    J416sAP | \
    J433AP | \
    J434AP | \
    J456AP | \
    J457AP | \
    J473AP | \
    J474sAP | \
    J475cAP | \
    J475dAP | \
    J493AP | \
    J504AP | \
    J514cAP | \
    J514mAP | \
    J514sAP | \
    J516cAP | \
    J516mAP | \
    J516sAP | \
    J575cAP | \
    J575dAP | \
    J604AP | \
    J613AP | \
    J614cAP | \
    J614sAP | \
    J615AP | \
    J616cAP | \
    J616sAP | \
    J623AP | \
    J624AP | \
    J700AP | \
    J704AP | \
    J713AP | \
    J714cAP | \
    J714sAP | \
    J715AP | \
    J716cAP | \
    J716sAP | \
    J773gAP | \
    J773sAP | \
    J813AP | \
    J815AP | \
    VMA2MACOSAP)
        echo "true"
        ;;
    *)
        echo "false"
        ;;
    esac
}


tahoe_upgrade_supported() {
    if [[ $( macos_major ) -ge 16 ]]; then
        echo "false"
        return
    fi
    if is_virtual; then
        echo "true"
        return
    fi

    case $( mac_model ) in
    iMac20,1 | \
    iMac20,2 | \
    iMac21,1 | \
    iMac21,2 | \
    Mac13,1 | \
    Mac13,2 | \
    Mac14,2 | \
    Mac14,3 | \
    Mac14,5 | \
    Mac14,6 | \
    Mac14,7 | \
    Mac14,8 | \
    Mac14,9 | \
    Mac14,10 | \
    Mac14,12 | \
    Mac14,13 | \
    Mac14,14 | \
    Mac14,15 | \
    Mac15,3 | \
    Mac15,4 | \
    Mac15,5 | \
    Mac15,6 | \
    Mac15,7 | \
    Mac15,8 | \
    Mac15,9 | \
    Mac15,10 | \
    Mac15,11 | \
    Mac15,12 | \
    Mac15,13 | \
    Mac15,14 | \
    Mac16,1 | \
    Mac16,2 | \
    Mac16,3 | \
    Mac16,5 | \
    Mac16,6 | \
    Mac16,7 | \
    Mac16,8 | \
    Mac16,9 | \
    Mac16,10 | \
    Mac16,11 | \
    Mac16,12 | \
    Mac16,13 | \
    Mac16,15 | \
    MacBookAir10,1 | \
    MacBookPro16,1 | \
    MacBookPro16,2 | \
    MacBookPro16,4 | \
    MacBookPro17,1 | \
    MacBookPro18,1 | \
    MacBookPro18,2 | \
    MacBookPro18,3 | \
    MacBookPro18,4 | \
    Macmini9,1 | \
    MacPro7,1 | \
    VirtualMac2,1)
        echo "true"
        ;;
    *)
        echo "false"
        ;;
    esac
}


sequoia_upgrade_supported() {
    if [[ $( macos_major ) -ge 15 ]]; then
        echo "false"
        return
    fi
    if is_virtual; then
        echo "true"
        return
    fi

    case $( mac_model ) in
    iMac19,1 | \
    iMac19,2 | \
    iMac20,1 | \
    iMac20,2 | \
    iMac21,1 | \
    iMac21,2 | \
    iMacPro1,1 | \
    Mac13,1 | \
    Mac13,2 | \
    Mac14,2 | \
    Mac14,3 | \
    Mac14,5 | \
    Mac14,6 | \
    Mac14,7 | \
    Mac14,8 | \
    Mac14,9 | \
    Mac14,10 | \
    Mac14,12 | \
    Mac14,13 | \
    Mac14,14 | \
    Mac14,15 | \
    Mac15,3 | \
    Mac15,4 | \
    Mac15,5 | \
    Mac15,6 | \
    Mac15,7 | \
    Mac15,8 | \
    Mac15,9 | \
    Mac15,10 | \
    Mac15,11 | \
    Mac15,12 | \
    Mac15,13 | \
    MacBookAir10,1 | \
    MacBookAir9,1 | \
    MacBookPro15,1 | \
    MacBookPro15,2 | \
    MacBookPro15,3 | \
    MacBookPro15,4 | \
    MacBookPro16,1 | \
    MacBookPro16,2 | \
    MacBookPro16,3 | \
    MacBookPro16,4 | \
    MacBookPro17,1 | \
    MacBookPro18,1 | \
    MacBookPro18,2 | \
    MacBookPro18,3 | \
    MacBookPro18,4 | \
    Macmini8,1 | \
    Macmini9,1 | \
    MacPro7,1 | \
    VirtualMac2,1)
        echo "true"
        ;;
    *)
        echo "false"
        ;;
    esac
}


sonoma_upgrade_supported() {
    if [[ $( macos_major ) -ge 14 ]]; then
        echo "false"
        return
    fi
    if is_virtual; then
        echo "true"
        return
    fi

    case $( mac_model ) in
    iMac19,1 | \
    iMac19,2 | \
    iMac20,1 | \
    iMac20,2 | \
    iMac21,1 | \
    iMac21,2 | \
    iMacPro1,1 | \
    iSim1,1 | \
    Mac13,1 | \
    Mac13,2 | \
    Mac14,10 | \
    Mac14,12 | \
    Mac14,13 | \
    Mac14,14 | \
    Mac14,15 | \
    Mac14,2 | \
    Mac14,3 | \
    Mac14,5 | \
    Mac14,6 | \
    Mac14,7 | \
    Mac14,8 | \
    Mac14,9 | \
    Mac15,3 | \
    Mac15,4 | \
    Mac15,5 | \
    Mac15,6 | \
    Mac15,7 | \
    Mac15,8 | \
    Mac15,9 | \
    MacBookAir10,1 | \
    MacBookAir8,1 | \
    MacBookAir8,2 | \
    MacBookAir9,1 | \
    MacBookPro15,1 | \
    MacBookPro15,2 | \
    MacBookPro15,3 | \
    MacBookPro15,4 | \
    MacBookPro16,1 | \
    MacBookPro16,2 | \
    MacBookPro16,3 | \
    MacBookPro16,4 | \
    MacBookPro17,1 | \
    MacBookPro18,1 | \
    MacBookPro18,2 | \
    MacBookPro18,3 | \
    MacBookPro18,4 | \
    Macmini8,1 | \
    Macmini9,1 | \
    MacPro7,1 | \
    VirtualMac2,1)
        echo "true"
        ;;
    *)
        echo "false"
        ;;
    esac
}


ventura_upgrade_supported() {
    if [[ $( macos_major ) -ge 13 ]]; then
        echo "false"
        return
    fi
    if is_virtual; then
        echo "true"
        return
    fi

    case $( mac_model ) in
    iMac18,1 | \
    iMac18,2 | \
    iMac18,3 | \
    iMac19,1 | \
    iMac19,2 | \
    iMac20,1 | \
    iMac20,2 | \
    iMac21,1 | \
    iMac21,2 | \
    iMacPro1,1 | \
    iSim1,1 | \
    Mac13,1 | \
    Mac13,2 | \
    Mac14,2 | \
    Mac14,7 | \
    MacBook10,1 | \
    MacBookAir10,1 | \
    MacBookAir8,1 | \
    MacBookAir8,2 | \
    MacBookAir9,1 | \
    MacBookPro14,1 | \
    MacBookPro14,2 | \
    MacBookPro14,3 | \
    MacBookPro15,1 | \
    MacBookPro15,2 | \
    MacBookPro15,3 | \
    MacBookPro15,4 | \
    MacBookPro16,1 | \
    MacBookPro16,2 | \
    MacBookPro16,3 | \
    MacBookPro16,4 | \
    MacBookPro17,1 | \
    MacBookPro18,1 | \
    MacBookPro18,2 | \
    MacBookPro18,3 | \
    MacBookPro18,4 | \
    Macmini8,1 | \
    Macmini9,1 | \
    MacPro7,1 | \
    VirtualMac2,1)
        echo "true"
        ;;
    *)
        echo "false"
        ;;
    esac
}


monterey_upgrade_supported() {
    if [[ $( macos_major ) -ge 12 ]]; then
        echo "false"
        return
    fi
    if is_virtual; then
        echo "true"
        return
    fi

    case $( mac_model ) in
    MacBook10,1 | \
    MacBook9,1 | \
    MacBookAir7,1 | \
    MacBookAir7,2 | \
    MacBookAir8,1 | \
    MacBookAir8,2 | \
    MacBookAir9,1 | \
    MacBookPro11,4 | \
    MacBookPro11,5 | \
    MacBookPro12,1 | \
    MacBookPro13,1 | \
    MacBookPro13,2 | \
    MacBookPro13,3 | \
    MacBookPro14,1 | \
    MacBookPro14,2 | \
    MacBookPro14,3 | \
    MacBookPro15,1 | \
    MacBookPro15,2 | \
    MacBookPro15,3 | \
    MacBookPro15,4 | \
    MacBookPro16,1 | \
    MacBookPro16,2 | \
    MacBookPro16,3 | \
    MacBookPro16,4 | \
    MacPro6,1 | \
    MacPro7,1 | \
    Macmini7,1 | \
    Macmini8,1 | \
    iMac16,1 | \
    iMac16,2 | \
    iMac17,1 | \
    iMac18,1 | \
    iMac18,2 | \
    iMac18,3 | \
    iMac19,1 | \
    iMac19,2 | \
    iMac20,1 | \
    iMac20,2 | \
    iMacPro1, | \
    VirtualMac2,1)
        echo "true"
        return
        ;;
    esac

    case $( board_id ) in
    Mac-06F11F11946D27C5 | \
    Mac-06F11FD93F0323C5 | \
    Mac-0CFF9C7C2B63DF8D | \
    Mac-112818653D3AABFC | \
    Mac-1E7E29AD0135F9BC | \
    Mac-226CB3C6A851A671 | \
    Mac-27AD2F918AE68F61 | \
    Mac-35C5E08120C7EEAF | \
    Mac-473D31EABEB93F9B | \
    Mac-4B682C642B45593E | \
    Mac-53FDB3D8DB8CA971 | \
    Mac-551B86E5744E2388 | \
    Mac-5F9802EFE386AA28 | \
    Mac-63001698E7A34814 | \
    Mac-65CE76090165799A | \
    Mac-66E35819EE2D0D05 | \
    Mac-77F17D7DA9285301 | \
    Mac-7BA5B2D9E42DDD94 | \
    Mac-7BA5B2DFE22DDD8C | \
    Mac-827FAC58A8FDFA22 | \
    Mac-827FB448E656EC26 | \
    Mac-937A206F2EE63C01 | \
    Mac-937CB26E2E02BB01 | \
    Mac-9AE82516C7C6B903 | \
    Mac-9F18E312C5C2BF0B | \
    Mac-A369DDC4E67F1C45 | \
    Mac-A5C67F76ED83108C | \
    Mac-A61BADE1FDAD7B05 | \
    Mac-AA95B1DDAB278B95 | \
    Mac-AF89B6D9451A490B | \
    Mac-B4831CEBD52A0C4C | \
    Mac-B809C3757DA9BB8D | \
    Mac-BE088AF8C5EB4FA2 | \
    Mac-CAD6701F7CEA0921 | \
    Mac-CFF7D910A743CAAF | \
    Mac-DB15BD556843C820 | \
    Mac-E1008331FDC96864 | \
    Mac-E43C1C25D4880AD6 | \
    Mac-E7203C0F68AA0004 | \
    Mac-EE2EBD4B90B839A8 | \
    Mac-F60DEB81FF30ACF6 | \
    Mac-FFE5EF870D7BA81A | \
    VMM-x86_64)
        echo "true"
        return
        ;;
    esac

    case $( hw_target ) in
    J132AP | \
    J137AP | \
    J140AAP | \
    J140KAP | \
    J152FAP | \
    J160AP | \
    J174AP | \
    J185AP | \
    J185FAP | \
    J213AP | \
    J214AP | \
    J214KAP | \
    J215AP | \
    J223AP | \
    J230AP | \
    J230KAP | \
    J274AP | \
    J293AP | \
    J313AP | \
    J314cAP | \
    J314sAP | \
    J316cAP | \
    J316sAP | \
    J456AP | \
    J457AP | \
    J680AP | \
    J780AP | \
    VMA2MACOSAP | \
    VMM-x86_64 | \
    X589AMLUAP | \
    X86LEGACYAP)
        echo "true"
        return
        ;;
    esac

    echo "false"
}


bigsur_upgrade_supported() {
    if [[ $( macos_major ) -ge 11 ]]; then
        echo "false"
        return
    fi
    if is_virtual; then
        echo "true"
        return
    fi

    case $( mac_model ) in
    MacBook10,1 | \
    MacBook8,1 | \
    MacBook9,1 | \
    MacBookAir6,1 | \
    MacBookAir6,2 | \
    MacBookAir7,1 | \
    MacBookAir7,2 | \
    MacBookAir8,1 | \
    MacBookAir8,2 | \
    MacBookPro11,2 | \
    MacBookPro11,3 | \
    MacBookPro11,4 | \
    MacBookPro11,5 | \
    MacBookPro12,1 | \
    MacBookPro13,1 | \
    MacBookPro13,2 | \
    MacBookPro13,3 | \
    MacBookPro14,1 | \
    MacBookPro14,2 | \
    MacBookPro14,3 | \
    MacBookPro15,1 | \
    MacBookPro15,2 | \
    MacBookPro15,3 | \
    MacBookPro15,4 | \
    MacPro6,1 | \
    MacPro7,1 | \
    Macmini7,1 | \
    Macmini8,1 | \
    iMac14,4 | \
    iMac15,1 | \
    iMac16,1 | \
    iMac16,2 | \
    iMac17,1 | \
    iMac18,1 | \
    iMac18,2 | \
    iMac18,3 | \
    iMac19,1 | \
    iMac19,2 | \
    iMacPro1,1 | \
    VirtualMac2,1)
        echo "true"
        return
        ;;
    esac

    case $( board_id ) in
    Mac-226CB3C6A851A671 | \
    Mac-36B6B6DA9CFCD881 | \
    Mac-112818653D3AABFC | \
    Mac-9394BDF4BF862EE7 | \
    Mac-AA95B1DDAB278B95 | \
    Mac-CAD6701F7CEA0921 | \
    Mac-50619A408DB004DA | \
    Mac-7BA5B2D9E42DDD94 | \
    Mac-CFF7D910A743CAAF | \
    Mac-B809C3757DA9BB8D | \
    Mac-F305150B0C7DEEEF | \
    Mac-35C1E88140C3E6CF | \
    Mac-827FAC58A8FDFA22 | \
    Mac-6FEBD60817C77D8A | \
    Mac-7BA5B2DFE22DDD8C | \
    Mac-827FB448E656EC26 | \
    Mac-66E35819EE2D0D05 | \
    Mac-BE0E8AC46FE800CC | \
    Mac-5A49A77366F81C72 | \
    Mac-63001698E7A34814 | \
    Mac-937CB26E2E02BB01 | \
    Mac-FFE5EF870D7BA81A | \
    Mac-87DCB00F4AD77EEA | \
    Mac-A61BADE1FDAD7B05 | \
    Mac-C6F71043CEAA02A6 | \
    Mac-4B682C642B45593E | \
    Mac-1E7E29AD0135F9BC | \
    Mac-90BE64C3CB5A9AEB | \
    Mac-3CBD00234E554E41 | \
    Mac-B4831CEBD52A0C4C | \
    Mac-E1008331FDC96864 | \
    Mac-FA842E06C61E91C5 | \
    Mac-81E3E92DD6088272 | \
    Mac-06F11FD93F0323C5 | \
    Mac-06F11F11946D27C5 | \
    Mac-F60DEB81FF30ACF6 | \
    Mac-473D31EABEB93F9B | \
    Mac-0CFF9C7C2B63DF8D | \
    Mac-9F18E312C5C2BF0B | \
    Mac-E7203C0F68AA0004 | \
    Mac-65CE76090165799A | \
    Mac-CF21D135A7D34AA6 | \
    Mac-112B0A653D3AAB9C | \
    Mac-DB15BD556843C820 | \
    Mac-27AD2F918AE68F61 | \
    Mac-937A206F2EE63C01 | \
    Mac-77F17D7DA9285301 | \
    Mac-9AE82516C7C6B903 | \
    Mac-BE088AF8C5EB4FA2 | \
    Mac-551B86E5744E2388 | \
    Mac-564FBA6031E5946A | \
    Mac-A5C67F76ED83108C | \
    Mac-5F9802EFE386AA28 | \
    Mac-747B1AEFF11738BE | \
    Mac-AF89B6D9451A490B | \
    Mac-EE2EBD4B90B839A8 | \
    Mac-42FD25EABCABB274 | \
    Mac-2BD1B31983FE1663 | \
    Mac-7DF21CB3ED6977E5 | \
    Mac-A369DDC4E67F1C45 | \
    Mac-35C5E08120C7EEAF | \
    Mac-E43C1C25D4880AD6 | \
    Mac-53FDB3D8DB8CA971 | \
    VMM-x86_64)
        echo "true"
        return
        ;;
    esac

    echo "false"
}


for f in $( declare -F | cut -d" " -f3- | grep "upgrade_supported" ); do
    set_fact "$f" bool $( $f )
done
