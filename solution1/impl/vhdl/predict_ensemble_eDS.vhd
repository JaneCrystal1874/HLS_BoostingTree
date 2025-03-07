-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eDS_rom is 
    generic(
             DWIDTH     : integer := 4; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_eDS_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0110", 1 => "1011", 2 => "0110", 3 => "0000", 4 => "1011", 
    5 to 6=> "0000", 7 => "1011", 8 => "1010", 9 => "0011", 10 => "0000", 
    11 => "1010", 12 to 13=> "0000", 14 => "1100", 15 => "0111", 16 => "0000", 
    17 to 18=> "0010", 19 => "1000", 20 => "0111", 21 => "0100", 22 => "0000", 
    23 => "1000", 24 => "0101", 25 => "0000", 26 => "1000", 27 => "0101", 
    28 => "1000", 29 => "0100", 30 => "0000", 31 => "1000", 32 => "0111", 
    33 => "1011", 34 => "0101", 35 => "1000", 36 => "0000", 37 => "0111", 
    38 => "1000", 39 => "1001", 40 => "0011", 41 => "1101", 42 => "0000", 
    43 => "1100", 44 to 46=> "0000", 47 => "0011", 48 => "0000", 49 => "0001", 
    50 => "0000", 51 => "0111", 52 => "1011", 53 to 57=> "0000", 58 => "1100", 
    59 => "0000", 60 => "0101", 61 to 69=> "0000", 70 => "0110", 71 => "1101", 
    72 => "0100", 73 => "1101", 74 to 75=> "0000", 76 => "0110", 77 => "1010", 
    78 => "0100", 79 to 81=> "0000", 82 => "1010", 83 to 84=> "0010", 85 => "0000", 
    86 => "0101", 87 to 89=> "0000", 90 => "0100", 91 to 92=> "0000", 93 => "0100", 
    94 => "0000", 95 => "0001", 96 => "1101", 97 => "1010", 98 => "0010", 
    99 to 100=> "0000", 101 to 102=> "0101", 103 => "0000", 104 => "0010", 105 => "0000", 
    106 => "0011", 107 to 109=> "0000", 110 => "0101", 111 => "0110", 112 => "0000", 
    113 => "1011", 114 to 116=> "0000", 117 => "1010", 118 => "0010", 119 => "0100", 
    120 => "1100", 121 => "0110", 122 => "1010", 123 => "0101", 124 to 126=> "0000", 
    127 => "0110", 128 => "0001", 129 => "1001", 130 => "0000", 131 => "0101", 
    132 => "0000", 133 => "1011", 134 => "0001", 135 => "0110", 136 to 137=> "0000", 
    138 => "0010", 139 to 141=> "0000", 142 => "0011", 143 => "0000", 144 => "1100", 
    145 => "0000", 146 => "1100", 147 to 149=> "0000", 150 => "0001", 151 to 153=> "0000", 
    154 => "1011", 155 => "0000", 156 => "1100", 157 => "0001", 158 => "0000", 
    159 => "0001", 160 => "0000", 161 => "1101", 162 => "1010", 163 => "0000", 
    164 => "1100", 165 to 170=> "0000", 171 => "0100", 172 => "0000", 173 => "1100", 
    174 => "0000", 175 => "1011", 176 to 177=> "0000", 178 => "0001", 179 => "0110", 
    180 to 194=> "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_eDS is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_eDS is
    component predict_ensemble_eDS_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eDS_rom_U :  component predict_ensemble_eDS_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


