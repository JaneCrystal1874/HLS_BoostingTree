-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cMA_rom is 
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


architecture rtl of predict_ensemble_cMA_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1000", 1 => "1011", 2 => "0000", 3 => "1010", 4 => "1001", 
    5 => "0000", 6 => "1010", 7 => "1101", 8 => "1010", 9 => "0000", 
    10 => "0111", 11 to 12=> "0000", 13 => "1010", 14 to 16=> "0000", 17 => "0011", 
    18 => "1010", 19 => "0000", 20 => "1011", 21 to 23=> "0000", 24 => "0101", 
    25 => "0011", 26 to 27=> "0000", 28 => "0111", 29 => "0000", 30 => "0101", 
    31 => "1010", 32 => "0000", 33 => "1010", 34 => "0000", 35 => "1010", 
    36 => "0000", 37 => "0110", 38 => "0000", 39 => "0101", 40 => "0000", 
    41 => "1010", 42 => "0111", 43 => "0000", 44 to 45=> "1001", 46 => "1011", 
    47 => "0000", 48 => "0110", 49 => "1011", 50 to 51=> "0000", 52 => "0111", 
    53 => "0000", 54 => "0001", 55 => "0000", 56 => "1011", 57 => "0000", 
    58 => "0101", 59 => "0000", 60 => "1011", 61 => "0000", 62 => "0001", 
    63 to 64=> "0000", 65 => "1011", 66 => "0000", 67 => "0011", 68 => "1100", 
    69 => "0100", 70 => "1011", 71 to 72=> "0000", 73 => "0111", 74 => "1100", 
    75 => "0111", 76 to 81=> "0000", 82 => "1101", 83 => "0000", 84 => "1101", 
    85 => "0000", 86 => "0111", 87 => "0000", 88 => "1100", 89 => "0111", 
    90 => "0000", 91 => "0001", 92 => "0000", 93 => "0101", 94 to 95=> "0000", 
    96 => "0100", 97 => "0001", 98 => "0000", 99 => "1000", 100 => "1010", 
    101 to 102=> "0100", 103 => "1000", 104 => "0011", 105 => "0000", 106 => "1010", 
    107 => "0000", 108 => "0110", 109 => "1100", 110 => "0111", 111 => "0011", 
    112 => "0101", 113 to 119=> "0000", 120 => "0001", 121 => "0000", 122 => "0001", 
    123 => "0000", 124 => "0010", 125 to 126=> "0000", 127 => "1010", 128 => "0000", 
    129 => "0100", 130 => "0001", 131 => "0000", 132 => "1010", 133 => "0100", 
    134 to 136=> "0000", 137 => "0101", 138 to 139=> "0000", 140 => "0011", 141 to 142=> "0000", 
    143 => "1011", 144 => "0111", 145 to 146=> "0000", 147 => "0101", 148 => "1011", 
    149 => "0000", 150 => "0100", 151 to 154=> "0000", 155 => "0110", 156 => "1101", 
    157 => "1011", 158 => "1101", 159 => "0000", 160 => "0111", 161 => "0000", 
    162 => "0111", 163 => "0001", 164 to 166=> "0000", 167 => "1101", 168 => "1100", 
    169 => "0000", 170 => "1011", 171 => "0000", 172 to 173=> "0101", 174 to 176=> "0000", 
    177 => "1000", 178 to 179=> "0000", 180 => "0101", 181 to 182=> "0000", 183 => "0011", 
    184 to 194=> "0000" );

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

entity predict_ensemble_cMA is
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

architecture arch of predict_ensemble_cMA is
    component predict_ensemble_cMA_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cMA_rom_U :  component predict_ensemble_cMA_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


