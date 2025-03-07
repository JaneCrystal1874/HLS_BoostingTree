-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eXV_rom is 
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


architecture rtl of predict_ensemble_eXV_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0011", 1 => "1010", 2 => "0000", 3 to 5=> "1010", 6 => "1011", 
    7 => "0000", 8 => "0111", 9 => "1011", 10 to 11=> "0000", 12 => "0011", 
    13 => "0101", 14 to 15=> "0000", 16 => "0010", 17 => "1101", 18 => "0000", 
    19 => "1101", 20 to 21=> "0000", 22 => "0101", 23 to 24=> "0000", 25 => "0011", 
    26 => "1011", 27 => "0101", 28 => "1010", 29 => "0001", 30 to 31=> "0000", 
    32 => "0110", 33 to 35=> "0000", 36 => "1010", 37 => "0000", 38 => "0001", 
    39 => "1011", 40 to 43=> "0000", 44 => "0011", 45 => "0000", 46 => "0111", 
    47 => "0000", 48 => "0110", 49 => "0111", 50 => "0000", 51 => "0001", 
    52 to 53=> "0000", 54 => "1000", 55 => "0000", 56 => "1001", 57 => "1011", 
    58 => "1100", 59 => "0000", 60 => "0111", 61 => "0000", 62 => "1000", 
    63 => "0000", 64 => "1001", 65 => "0000", 66 => "0100", 67 => "1011", 
    68 to 69=> "0000", 70 => "0111", 71 => "0000", 72 => "0100", 73 => "1001", 
    74 => "1010", 75 to 76=> "0000", 77 => "1010", 78 to 81=> "0000", 82 => "0011", 
    83 to 85=> "0000", 86 => "0111", 87 => "0000", 88 => "0111", 89 => "0000", 
    90 => "1011", 91 => "0000", 92 to 93=> "0101", 94 => "0000", 95 => "1000", 
    96 => "0000", 97 => "1000", 98 => "1100", 99 => "0000", 100 => "0101", 
    101 => "1100", 102 => "1101", 103 => "0001", 104 => "0000", 105 => "0100", 
    106 to 110=> "0000", 111 => "0100", 112 => "0000", 113 => "0111", 114 to 115=> "0000", 
    116 => "0111", 117 => "0001", 118 => "1011", 119 to 120=> "0000", 121 => "1000", 
    122 => "0111", 123 => "1010", 124 => "0000", 125 => "0111", 126 to 127=> "0000", 
    128 to 129=> "0010", 130 => "1101", 131 => "0000", 132 => "1100", 133 => "0000", 
    134 => "1100", 135 => "0000", 136 => "0011", 137 => "0000", 138 => "1101", 
    139 to 143=> "0000", 144 => "0010", 145 => "1101", 146 => "1010", 147 => "1101", 
    148 => "0100", 149 to 150=> "0000", 151 => "1100", 152 => "0000", 153 => "1000", 
    154 => "0000", 155 => "1101", 156 => "1011", 157 to 158=> "0000", 159 => "0101", 
    160 to 162=> "0000", 163 => "0101", 164 => "0000", 165 => "1010", 166 => "0000", 
    167 => "1010", 168 to 194=> "0000" );

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

entity predict_ensemble_eXV is
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

architecture arch of predict_ensemble_eXV is
    component predict_ensemble_eXV_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eXV_rom_U :  component predict_ensemble_eXV_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


