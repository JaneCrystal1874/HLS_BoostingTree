-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cCy_rom is 
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


architecture rtl of predict_ensemble_cCy_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0111", 1 => "1011", 2 => "0011", 3 => "0000", 4 => "1001", 
    5 => "0000", 6 => "0100", 7 => "0000", 8 => "1010", 9 => "0000", 
    10 => "0001", 11 => "1010", 12 => "1100", 13 => "0000", 14 => "1001", 
    15 => "1011", 16 to 19=> "0000", 20 => "1011", 21 => "0011", 22 => "1011", 
    23 to 24=> "0000", 25 => "0111", 26 to 27=> "0000", 28 => "1001", 29 to 31=> "0000", 
    32 to 33=> "0101", 34 => "0000", 35 => "1010", 36 => "0000", 37 => "0011", 
    38 => "1000", 39 => "0000", 40 => "0011", 41 to 43=> "0000", 44 => "1100", 
    45 => "0010", 46 => "1100", 47 => "0101", 48 to 49=> "0000", 50 => "1100", 
    51 => "1010", 52 to 53=> "0000", 54 => "0110", 55 to 56=> "0000", 57 => "0100", 
    58 => "0101", 59 => "0011", 60 => "0100", 61 to 65=> "0000", 66 => "1010", 
    67 => "1011", 68 => "0000", 69 => "1100", 70 => "0000", 71 => "1010", 
    72 => "0000", 73 => "0101", 74 to 75=> "0000", 76 => "1011", 77 => "0000", 
    78 => "0111", 79 => "0000", 80 to 81=> "1001", 82 => "0001", 83 => "0111", 
    84 => "0000", 85 => "1101", 86 => "1011", 87 => "1001", 88 => "0000", 
    89 => "1010", 90 => "0011", 91 => "0000", 92 => "1000", 93 => "0000", 
    94 => "1100", 95 => "0010", 96 to 99=> "0000", 100 => "0101", 101 => "0000", 
    102 => "0101", 103 to 104=> "0000", 105 => "1010", 106 to 107=> "0000", 108 => "0010", 
    109 => "1100", 110 to 113=> "0000", 114 => "1011", 115 => "0000", 116 => "1000", 
    117 => "0111", 118 => "0110", 119 to 120=> "1001", 121 to 125=> "0000", 126 => "1001", 
    127 => "0100", 128 => "0000", 129 => "0100", 130 => "1011", 131 => "1100", 
    132 => "0101", 133 to 137=> "0000", 138 => "0100", 139 => "0101", 140 to 141=> "0011", 
    142 => "0111", 143 => "1101", 144 => "0010", 145 to 150=> "0000", 151 to 152=> "0001", 
    153 => "0110", 154 => "0010", 155 => "0000", 156 => "1011", 157 => "0000", 
    158 => "0001", 159 to 161=> "0000", 162 => "1011", 163 to 165=> "0000", 166 => "0100", 
    167 => "0010", 168 => "1101", 169 => "1100", 170 => "0110", 171 to 174=> "0000", 
    175 => "1100", 176 to 177=> "0000", 178 => "1010", 179 => "0011", 180 to 194=> "0000" );

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

entity predict_ensemble_cCy is
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

architecture arch of predict_ensemble_cCy is
    component predict_ensemble_cCy_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cCy_rom_U :  component predict_ensemble_cCy_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


