-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cHz_rom is 
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


architecture rtl of predict_ensemble_cHz_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "1001", 4 => "1011", 
    5 to 7=> "0000", 8 => "1011", 9 => "0000", 10 => "0011", 11 => "0000", 
    12 to 13=> "1010", 14 => "1100", 15 => "1010", 16 => "0110", 17 to 18=> "0000", 
    19 to 20=> "0101", 21 to 22=> "0000", 23 => "0101", 24 to 26=> "0000", 27 => "1001", 
    28 to 29=> "0000", 30 => "0111", 31 => "1011", 32 => "1010", 33 => "1101", 
    34 => "1010", 35 => "1011", 36 to 38=> "0000", 39 => "1101", 40 => "0001", 
    41 => "0000", 42 => "0001", 43 => "0011", 44 => "0000", 45 => "0101", 
    46 => "0001", 47 => "0000", 48 => "0101", 49 => "1000", 50 to 51=> "0000", 
    52 => "1000", 53 => "0000", 54 => "0100", 55 to 61=> "0000", 62 => "1100", 
    63 => "1011", 64 => "0000", 65 => "0100", 66 to 67=> "0000", 68 => "0011", 
    69 => "1100", 70 => "0001", 71 => "0000", 72 => "0001", 73 => "1010", 
    74 => "0001", 75 => "1000", 76 => "0011", 77 => "0101", 78 to 79=> "0000", 
    80 to 81=> "0111", 82 to 86=> "0000", 87 => "0100", 88 => "1010", 89 => "0000", 
    90 => "0001", 91 => "1010", 92 => "0000", 93 => "1010", 94 to 96=> "0000", 
    97 => "0101", 98 => "0000", 99 => "0011", 100 to 103=> "0000", 104 => "0100", 
    105 => "0111", 106 => "0011", 107 => "0010", 108 => "1010", 109 => "0001", 
    110 to 112=> "0000", 113 => "1010", 114 => "1101", 115 => "1011", 116 => "0000", 
    117 => "0101", 118 => "0000", 119 => "0111", 120 to 121=> "0000", 122 => "1000", 
    123 to 125=> "0000", 126 => "0111", 127 => "1100", 128 => "0101", 129 to 131=> "0000", 
    132 => "1000", 133 to 134=> "0000", 135 => "1000", 136 to 137=> "0110", 138 => "1000", 
    139 to 142=> "0000", 143 => "0101", 144 => "0000", 145 => "1101", 146 => "1011", 
    147 => "0000", 148 => "0011", 149 => "0001", 150 => "0000", 151 => "0101", 
    152 => "1011", 153 to 157=> "0000", 158 => "0110", 159 => "1101", 160 => "0110", 
    161 => "0010", 162 => "0000", 163 => "1010", 164 => "1100", 165 to 166=> "0000", 
    167 => "0010", 168 to 170=> "0000", 171 => "0010", 172 => "0111", 173 => "1101", 
    174 => "0001", 175 to 176=> "0000", 177 => "0110", 178 to 181=> "0000", 182 => "1000", 
    183 => "0110", 184 to 194=> "0000" );

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

entity predict_ensemble_cHz is
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

architecture arch of predict_ensemble_cHz is
    component predict_ensemble_cHz_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cHz_rom_U :  component predict_ensemble_cHz_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


