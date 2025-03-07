-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_esQ_rom is 
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


architecture rtl of predict_ensemble_esQ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 => "1", 4 to 5=> "0", 6 => "1", 7 => "0", 8 to 9=> "1", 10 => "0", 
    11 => "1", 12 to 16=> "0", 17 to 23=> "1", 24 => "0", 25 => "1", 26 => "0", 27 => "1", 
    28 to 29=> "0", 30 to 31=> "1", 32 => "0", 33 => "1", 34 => "0", 35 => "1", 36 to 39=> "0", 
    40 to 41=> "1", 42 to 44=> "0", 45 to 49=> "1", 50 to 51=> "0", 52 to 53=> "1", 54 to 58=> "0", 59 to 60=> "1", 
    61 => "0", 62 to 65=> "1", 66 to 68=> "0", 69 to 70=> "1", 71 to 73=> "0", 74 => "1", 75 => "0", 
    76 => "1", 77 => "0", 78 => "1", 79 => "0", 80 => "1", 81 to 83=> "0", 84 to 89=> "1", 
    90 to 96=> "0", 97 to 99=> "1", 100 to 101=> "0", 102 to 103=> "1", 104 => "0", 105 to 107=> "1", 108 to 110=> "0", 
    111 => "1", 112 => "0", 113 to 114=> "1", 115 => "0", 116 to 118=> "1", 119 to 121=> "0", 122 => "1", 
    123 => "0", 124 to 127=> "1", 128 => "0", 129 => "1", 130 to 134=> "0", 135 => "1", 136 => "0", 
    137 to 140=> "1", 141 to 142=> "0", 143 to 144=> "1", 145 to 146=> "0", 147 => "1", 148 to 149=> "0", 150 => "1", 
    151 => "0", 152 to 154=> "1", 155 to 156=> "0", 157 to 159=> "1", 160 => "0", 161 => "1", 162 => "0", 
    163 => "1", 164 => "0", 165 to 166=> "1", 167 to 194=> "0" );

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

entity predict_ensemble_esQ is
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

architecture arch of predict_ensemble_esQ is
    component predict_ensemble_esQ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_esQ_rom_U :  component predict_ensemble_esQ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


