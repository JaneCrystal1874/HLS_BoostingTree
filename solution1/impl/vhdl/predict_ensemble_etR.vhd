-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_etR_rom is 
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


architecture rtl of predict_ensemble_etR_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0111", 1 => "1011", 2 => "1010", 3 => "0000", 4 => "0101", 
    5 => "0111", 6 => "0000", 7 => "1011", 8 to 9=> "0000", 10 => "0101", 
    11 => "0000", 12 => "1011", 13 => "0100", 14 => "0111", 15 => "1001", 
    16 => "1011", 17 to 23=> "0000", 24 => "1011", 25 => "0000", 26 => "1011", 
    27 => "0000", 28 => "0101", 29 => "0011", 30 to 31=> "0000", 32 => "0011", 
    33 => "0000", 34 => "1001", 35 => "0000", 36 => "0111", 37 => "1000", 
    38 => "0111", 39 => "0011", 40 to 41=> "0000", 42 => "1011", 43 => "0011", 
    44 => "0111", 45 to 49=> "0000", 50 => "1010", 51 => "1011", 52 to 53=> "0000", 
    54 => "0110", 55 => "1000", 56 => "1010", 57 to 58=> "1000", 59 to 60=> "0000", 
    61 => "1100", 62 to 65=> "0000", 66 => "0001", 67 => "1100", 68 => "0011", 
    69 to 70=> "0000", 71 => "1011", 72 => "1010", 73 => "1000", 74 => "0000", 
    75 => "0100", 76 => "0000", 77 => "0111", 78 => "0000", 79 => "1000", 
    80 => "0000", 81 => "1011", 82 => "1010", 83 => "1001", 84 to 89=> "0000", 
    90 => "0110", 91 => "0011", 92 => "1101", 93 to 94=> "0101", 95 => "1101", 
    96 => "1100", 97 to 99=> "0000", 100 => "1010", 101 => "1100", 102 to 103=> "0000", 
    104 => "0111", 105 to 107=> "0000", 108 => "1010", 109 => "0010", 110 => "1000", 
    111 => "0000", 112 => "0011", 113 to 114=> "0000", 115 => "1011", 116 to 118=> "0000", 
    119 => "0001", 120 => "1011", 121 => "0111", 122 => "0000", 123 => "1010", 
    124 to 127=> "0000", 128 => "1000", 129 => "0000", 130 to 132=> "1101", 133 => "1010", 
    134 => "0111", 135 => "0000", 136 => "0011", 137 to 140=> "0000", 141 => "1011", 
    142 => "0111", 143 to 144=> "0000", 145 => "0110", 146 => "0001", 147 => "0000", 
    148 to 149=> "1100", 150 => "0000", 151 => "0100", 152 to 154=> "0000", 155 to 156=> "0100", 
    157 to 159=> "0000", 160 => "1001", 161 => "0000", 162 => "0101", 163 => "0000", 
    164 => "0011", 165 to 194=> "0000" );

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

entity predict_ensemble_etR is
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

architecture arch of predict_ensemble_etR is
    component predict_ensemble_etR_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_etR_rom_U :  component predict_ensemble_etR_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


