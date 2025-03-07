-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dKJ_rom is 
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


architecture rtl of predict_ensemble_dKJ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0011", 4 to 5=> "0000", 6 => "1010", 7 => "0011", 8 => "0000", 
    9 => "1010", 10 => "1100", 11 to 12=> "0000", 13 => "1001", 14 => "0111", 
    15 => "0101", 16 => "1100", 17 => "0000", 18 => "0111", 19 => "0000", 
    20 => "1001", 21 to 22=> "0000", 23 to 24=> "0110", 25 => "1101", 26 => "1010", 
    27 to 29=> "0000", 30 to 31=> "0110", 32 => "0111", 33 => "1000", 34 => "0001", 
    35 => "1000", 36 => "0010", 37 => "0000", 38 => "0011", 39 to 41=> "0000", 
    42 => "0100", 43 => "0011", 44 to 45=> "0000", 46 => "1011", 47 => "1000", 
    48 => "1001", 49 => "0000", 50 => "0110", 51 to 52=> "0000", 53 => "0010", 
    54 => "1011", 55 => "0110", 56 => "0000", 57 => "0010", 58 => "0000", 
    59 => "1000", 60 => "0110", 61 => "0000", 62 => "0011", 63 => "0100", 
    64 to 67=> "0000", 68 => "1101", 69 => "0000", 70 => "1001", 71 => "0110", 
    72 => "0010", 73 => "1010", 74 => "0001", 75 => "0000", 76 => "0101", 
    77 to 78=> "0000", 79 => "1100", 80 => "1001", 81 => "0000", 82 => "1100", 
    83 => "1001", 84 => "0010", 85 => "0000", 86 => "0111", 87 to 89=> "0000", 
    90 => "0101", 91 => "0001", 92 => "0111", 93 to 94=> "0000", 95 => "0101", 
    96 to 99=> "0000", 100 => "1010", 101 to 103=> "0000", 104 => "0101", 105 to 106=> "0000", 
    107 => "0101", 108 => "0000", 109 => "1011", 110 to 115=> "0000", 116 => "0101", 
    117 to 118=> "0000", 119 => "0101", 120 => "0001", 121 to 123=> "0000", 124 => "0011", 
    125 => "1100", 126 => "0000", 127 => "0101", 128 to 129=> "0000", 130 => "0011", 
    131 => "1011", 132 => "0110", 133 => "0000", 134 => "1100", 135 to 136=> "0000", 
    137 => "0010", 138 => "0000", 139 => "1011", 140 => "0000", 141 => "1001", 
    142 => "1010", 143 to 146=> "0000", 147 => "0101", 148 => "0110", 149 => "0100", 
    150 => "0001", 151 => "1000", 152 => "0001", 153 to 154=> "0000", 155 => "0101", 
    156 to 157=> "1101", 158 => "0000", 159 to 160=> "0111", 161 => "0000", 162 => "1011", 
    163 => "1010", 164 => "1011", 165 to 168=> "0000", 169 => "1101", 170 to 171=> "0000", 
    172 => "1010", 173 to 194=> "0000" );

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

entity predict_ensemble_dKJ is
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

architecture arch of predict_ensemble_dKJ is
    component predict_ensemble_dKJ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dKJ_rom_U :  component predict_ensemble_dKJ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


