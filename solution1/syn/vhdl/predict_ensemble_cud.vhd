-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cud_rom is 
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


architecture rtl of predict_ensemble_cud_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1000", 1 => "0111", 2 => "0011", 3 => "1101", 4 => "0001", 
    5 to 6=> "1000", 7 => "0110", 8 => "1000", 9 => "0000", 10 => "0010", 
    11 => "0110", 12 => "0111", 13 to 14=> "0101", 15 => "0011", 16 => "1100", 
    17 => "1000", 18 => "0101", 19 => "1001", 20 to 22=> "0000", 23 to 24=> "0100", 
    25 => "0011", 26 => "0101", 27 => "0110", 28 to 29=> "0000", 30 => "0111", 
    31 => "0010", 32 => "0100", 33 => "1010", 34 => "1001", 35 to 44=> "0000", 
    45 => "0110", 46 => "1011", 47 => "0000", 48 => "0011", 49 => "1011", 
    50 => "1100", 51 => "1011", 52 to 53=> "0101", 54 => "0110", 55 => "1001", 
    56 => "0101", 57 => "1010", 58 => "0101", 59 => "0000", 60 => "1100", 
    61 => "0101", 62 to 63=> "0000", 64 => "1000", 65 => "1100", 66 => "0000", 
    67 to 68=> "0001", 69 => "0000", 70 => "0001", 71 => "0100", 72 => "0010", 
    73 => "0101", 74 => "1101", 75 => "0101", 76 => "1000", 77 => "0000", 
    78 => "1000", 79 => "0110", 80 => "0000", 81 => "0110", 82 => "0000", 
    83 => "0011", 84 to 87=> "0000", 88 => "0100", 89 => "0000", 90 => "0001", 
    91 to 98=> "0000", 99 to 100=> "0001", 101 => "0011", 102 => "1000", 103 to 104=> "0000", 
    105 => "0110", 106 => "0000", 107 => "0010", 108 => "0100", 109 => "1010", 
    110 => "1101", 111 => "0110", 112 => "0001", 113 => "0101", 114 => "0110", 
    115 to 118=> "0000", 119 => "0001", 120 to 121=> "0011", 122 => "1011", 123 to 128=> "0000", 
    129 to 130=> "0001", 131 to 134=> "0000", 135 => "1010", 136 to 137=> "0000", 138 => "0101", 
    139 => "0000", 140 => "1101", 141 => "0000", 142 => "0111", 143 to 151=> "0000", 
    152 => "0101", 153 to 155=> "0000", 156 => "0100", 157 to 158=> "0000", 159 => "1011", 
    160 => "0000", 161 => "0101", 162 to 164=> "0000", 165 => "0010", 166 to 176=> "0000", 
    177 => "1010", 178 to 194=> "0000" );

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

entity predict_ensemble_cud is
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

architecture arch of predict_ensemble_cud is
    component predict_ensemble_cud_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cud_rom_U :  component predict_ensemble_cud_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


