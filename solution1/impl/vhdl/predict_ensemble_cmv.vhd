-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cmv_rom is 
    generic(
             DWIDTH     : integer := 1; 
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


architecture rtl of predict_ensemble_cmv_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 => "0", 5 => "1", 6 to 7=> "0", 
    8 => "1", 9 to 10=> "0", 11 to 12=> "1", 13 to 14=> "0", 15 => "1", 16 to 17=> "0", 18 to 20=> "1", 
    21 to 23=> "0", 24 to 26=> "1", 27 to 28=> "0", 29 to 30=> "1", 31 to 32=> "0", 33 => "1", 34 => "0", 
    35 => "1", 36 to 37=> "0", 38 => "1", 39 to 41=> "0", 42 to 43=> "1", 44 => "0", 45 to 46=> "1", 
    47 => "0", 48 to 49=> "1", 50 to 52=> "0", 53 => "1", 54 to 55=> "0", 56 => "1", 57 to 60=> "0", 
    61 to 63=> "1", 64 => "0", 65 => "1", 66 => "0", 67 to 68=> "1", 69 => "0", 70 to 73=> "1", 
    74 to 77=> "0", 78 => "1", 79 => "0", 80 to 81=> "1", 82 to 83=> "0", 84 => "1", 85 => "0", 
    86 to 88=> "1", 89 => "0", 90 => "1", 91 => "0", 92 => "1", 93 to 97=> "0", 98 to 103=> "1", 
    104 => "0", 105 to 107=> "1", 108 to 110=> "0", 111 to 113=> "1", 114 => "0", 115 => "1", 116 => "0", 
    117 => "1", 118 to 121=> "0", 122 => "1", 123 => "0", 124 => "1", 125 to 126=> "0", 127 => "1", 
    128 to 129=> "0", 130 => "1", 131 => "0", 132 to 133=> "1", 134 => "0", 135 to 136=> "1", 137 to 138=> "0", 
    139 to 140=> "1", 141 to 143=> "0", 144 => "1", 145 to 147=> "0", 148 to 149=> "1", 150 to 152=> "0", 153 to 154=> "1", 
    155 to 156=> "0", 157 => "1", 158 to 160=> "0", 161 to 162=> "1", 163 => "0", 164 => "1", 165 => "0", 
    166 to 167=> "1", 168 => "0", 169 to 172=> "1", 173 to 174=> "0", 175 => "1", 176 => "0", 177 => "1", 
    178 to 179=> "0", 180 to 183=> "1", 184 => "0", 185 to 190=> "1", 191 to 194=> "0" );

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

entity predict_ensemble_cmv is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_cmv is
    component predict_ensemble_cmv_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cmv_rom_U :  component predict_ensemble_cmv_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


