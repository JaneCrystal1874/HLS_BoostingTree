-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_mb6_rom is 
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


architecture rtl of predict_ensemble_mb6_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0101", 2 to 3=> "1011", 4 => "0000", 5 => "0101", 
    6 => "1000", 7 to 10=> "0000", 11 => "1011", 12 => "1010", 13 => "0000", 
    14 => "1011", 15 to 16=> "0000", 17 => "0100", 18 => "1011", 19 => "0000", 
    20 => "0100", 21 => "0011", 22 => "1010", 23 => "1101", 24 to 25=> "1000", 
    26 => "1101", 27 => "1001", 28 => "0001", 29 to 32=> "0000", 33 => "0011", 
    34 => "0100", 35 => "1011", 36 to 37=> "0000", 38 => "0011", 39 to 46=> "0000", 
    47 to 48=> "0011", 49 to 50=> "0000", 51 => "0011", 52 => "1010", 53 => "1011", 
    54 => "0000", 55 => "0011", 56 => "0111", 57 => "1000", 58 => "0111", 
    59 => "0101", 60 => "0000", 61 => "1011", 62 to 66=> "0000", 67 => "0110", 
    68 => "1010", 69 => "1011", 70 to 72=> "0000", 73 => "1011", 74 => "0101", 
    75 => "0100", 76 => "0000", 77 => "0111", 78 => "1011", 79 => "0000", 
    80 => "0110", 81 => "0000", 82 => "1010", 83 => "1001", 84 => "0111", 
    85 => "0000", 86 => "1011", 87 => "1001", 88 => "1101", 89 => "1100", 
    90 => "0010", 91 => "0110", 92 to 93=> "0000", 94 => "0010", 95 => "1011", 
    96 => "0000", 97 => "0101", 98 => "0111", 99 to 100=> "0000", 101 => "0101", 
    102 to 103=> "0000", 104 => "1101", 105 => "0001", 106 => "0000", 107 => "0110", 
    108 => "0011", 109 to 113=> "0000", 114 => "1100", 115 => "0000", 116 => "1000", 
    117 => "0000", 118 => "0011", 119 => "0000", 120 to 122=> "1011", 123 to 124=> "0000", 
    125 to 126=> "1011", 127 to 128=> "0000", 129 => "0001", 130 => "0011", 131 to 133=> "0000", 
    134 => "1010", 135 => "0000", 136 => "1000", 137 to 140=> "0000", 141 => "1011", 
    142 => "0100", 143 => "0111", 144 => "0011", 145 => "0000", 146 => "0111", 
    147 to 150=> "0000", 151 => "0110", 152 => "0011", 153 to 155=> "0000", 156 to 157=> "0011", 
    158 => "1001", 159 to 161=> "0000", 162 => "0100", 163 => "0001", 164 to 168=> "0000", 
    169 => "0111", 170 => "1001", 171 to 172=> "0000", 173 => "1101", 174 => "0100", 
    175 => "0000", 176 => "0010", 177 to 181=> "0000", 182 => "1011", 183 to 194=> "0000" );

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

entity predict_ensemble_mb6 is
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

architecture arch of predict_ensemble_mb6 is
    component predict_ensemble_mb6_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_mb6_rom_U :  component predict_ensemble_mb6_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


