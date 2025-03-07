-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Bew_rom is 
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


architecture rtl of predict_ensemble_Bew_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1010", 1 => "1001", 2 => "0111", 3 => "0000", 4 => "1011", 
    5 => "0000", 6 => "1100", 7 to 8=> "1011", 9 to 10=> "0000", 11 to 12=> "1100", 
    13 => "0000", 14 to 15=> "1011", 16 to 18=> "0000", 19 => "0011", 20 => "1011", 
    21 => "1101", 22 to 24=> "0000", 25 => "1001", 26 => "1011", 27 to 28=> "0000", 
    29 => "0111", 30 to 31=> "0000", 32 => "1011", 33 to 35=> "0000", 36 => "1001", 
    37 => "1010", 38 => "0000", 39 => "1010", 40 => "1100", 41 => "0110", 
    42 => "0000", 43 => "0011", 44 => "1101", 45 => "1010", 46 to 48=> "0000", 
    49 => "0101", 50 => "1100", 51 to 52=> "0000", 53 => "1101", 54 to 55=> "0000", 
    56 => "0001", 57 => "1010", 58 to 59=> "0000", 60 => "0100", 61 => "0001", 
    62 => "0000", 63 => "0011", 64 => "0010", 65 to 67=> "0000", 68 => "0110", 
    69 => "1010", 70 => "0010", 71 to 73=> "0000", 74 => "0100", 75 => "1011", 
    76 => "0010", 77 => "1010", 78 to 81=> "0000", 82 => "1010", 83 => "0000", 
    84 => "0100", 85 => "1011", 86 to 88=> "1010", 89 => "0101", 90 => "0000", 
    91 => "0111", 92 => "0011", 93 => "0000", 94 => "1011", 95 to 96=> "0011", 
    97 => "1000", 98 to 100=> "0000", 101 => "1010", 102 => "0000", 103 => "1000", 
    104 => "0000", 105 => "1000", 106 to 108=> "0000", 109 => "0111", 110 to 111=> "0000", 
    112 => "1010", 113 to 115=> "0000", 116 => "1010", 117 to 118=> "0000", 119 => "0010", 
    120 => "1010", 121 to 125=> "0000", 126 => "1101", 127 => "0000", 128 => "0001", 
    129 => "1011", 130 => "1010", 131 => "0000", 132 => "0110", 133 => "1010", 
    134 to 135=> "0000", 136 => "0110", 137 => "0001", 138 => "0000", 139 => "1010", 
    140 => "0000", 141 => "1000", 142 => "0111", 143 to 144=> "0000", 145 => "0101", 
    146 to 147=> "0011", 148 => "0000", 149 => "0001", 150 to 151=> "0000", 152 to 153=> "0111", 
    154 to 156=> "0000", 157 => "0100", 158 => "0111", 159 => "0000", 160 => "1001", 
    161 => "0100", 162 => "0101", 163 to 168=> "0000", 169 => "0101", 170 => "1100", 
    171 => "1101", 172 to 174=> "0000", 175 => "0100", 176 => "1000", 177 => "0010", 
    178 to 194=> "0000" );

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

entity predict_ensemble_Bew is
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

architecture arch of predict_ensemble_Bew is
    component predict_ensemble_Bew_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Bew_rom_U :  component predict_ensemble_Bew_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


